# asst2-s18

My GPU is one Nvidia RTX 3090, which requires the cuda version should be no less than 11.0. So, here I cannot do a quantitative research on our experiment.

## SAXPY

The performance of this cuda code segment is
```
---------------------------------------------------------
Found 1 CUDA devices
Device 0: NVIDIA GeForce RTX 3090
   SMs:        82
   Global mem: 24266 MB
   CUDA Cap:   8.6
---------------------------------------------------------
Overall: 24.876 ms              [8.985 GB/s]
Overall: 25.166 ms              [8.882 GB/s]
Overall: 25.289 ms              [8.839 GB/s]
```
> The maximum memory bandwidth of the Nvidia RTX 3090 is 936GB/s. 8~9GB/s is far from this bandwidth limit. I guess the limitation of our device is the computation power.

The code is as follows:
```c
void
saxpyCuda(int N, float alpha, float* xarray, float* yarray, float* resultarray) {

    int totalBytes = sizeof(float) * 3 * N;

    // compute number of blocks and threads per block
    const int threadsPerBlock = 512;
    const int blocks = (N + threadsPerBlock - 1) / threadsPerBlock;

    float* device_x;
    float* device_y;
    float* device_result;

    //
    // TODO allocate device memory buffers on the GPU using cudaMalloc
    //
    cudaMalloc(&device_x, N * sizeof(float));
    cudaMalloc(&device_y, N * sizeof(float));
    cudaMalloc(&device_result, N * sizeof(float));

    // start timing after allocation of device memory
    double startTime = CycleTimer::currentSeconds();

    //
    // TODO copy input arrays to the GPU using cudaMemcpy
    //
    cudaMemcpy(device_x, xarray, N * sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(device_y, yarray, N * sizeof(float), cudaMemcpyHostToDevice);

    // run kernel
    saxpy_kernel<<<blocks, threadsPerBlock>>>(N, alpha, device_x, device_y, device_result);
    cudaThreadSynchronize();

    //
    // TODO copy result from GPU using cudaMemcpy
    //
    cudaMemcpy(resultarray, device_result, N * sizeof(float), cudaMemcpyDeviceToHost);

    // end timing after result has been copied back into host memory
    double endTime = CycleTimer::currentSeconds();

    cudaError_t errCode = cudaPeekAtLastError();
    if (errCode != cudaSuccess) {
        fprintf(stderr, "WARNING: A CUDA error occured: code=%d, %s\n", errCode, cudaGetErrorString(errCode));
    }

    double overallDuration = endTime - startTime;
    printf("Overall: %.3f ms\t\t[%.3f GB/s]\n", 1000.f * overallDuration, toBW(totalBytes, overallDuration));

    // TODO free memory buffers on the GPU
    cudaFree(device_x);
    cudaFree(device_y);
    cudaFree(device_result);
}
```

## Parallel Prefix-Sum

Take the array `[1, 2, 2, 1, 1, 1, 3, 5, 3, 3]` as an example. The procedure of our method is as follows:
1. concurrently convert this array as an indicator array (if arr[i] == arr[i+1], then set indicator[i] = 1, otherwise, set indicator[i] = 0) => `[0, 1, 0, 1, 1, 0, 0, 0, 1]`;
2. use the prefix sum to get the index (just like count sort algorithm) => `[0, 0, 1, 1, 2, 3, 3, 3, 3]`;
3. fill the result array with the index outputed in the last procedure where indicator[i] == 1.

### Prefix-Sum
The performance of our prefix-sum program is as follows:
```
-------------------------
Scan Score Table:
-------------------------
-------------------------------------------------------------------------
| Element Count   | Target Time     | Your Time       | Score           |
-------------------------------------------------------------------------
| 10000           |                 | 0.128           | 0               |
| 100000          |                 | 0.117           | 0               |
| 1000000         |                 | 0.201           | 0               |
| 2000000         |                 | 0.337           | 0               |
-------------------------------------------------------------------------
|                                   | Total score:    | 0/5             |
-------------------------------------------------------------------------
```

Our source code is like that:
```c
__global__
void exclusive_scan_upsweep(int N, int twod, int twod1, int *output) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int base = (i + 1) * twod1 - 1;
    if (base < N) {
        output[base] += output[base - twod];
    }
}

__global__
void exclusive_scan_downsweep(int N, int twod, int twod1, int *output) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int base = (i + 1) * twod1 - 1;
    if (base < N) {
        int t = output[base - twod];
        output[base - twod] = output[base];
        output[base] += t;
    }
}

void exclusive_scan(int* device_start, int length, int* device_result)
{
    /* Fill in this function with your exclusive scan implementation.
     * You are passed the locations of the input and output in device memory,
     * but this is host code -- you will need to declare one or more CUDA 
     * kernels (with the __global__ decorator) in order to actually run code
     * in parallel on the GPU.
     * Note you are given the real length of the array, but may assume that
     * both the input and the output arrays are sized to accommodate the next
     * power of 2 larger than the input.
     */
    
    int rounded_length = nextPow2(length);
    if (rounded_length == 0) {
        return;
    }
    const int threadsPerBlock = 512;
    for (int twod = 1; twod < rounded_length; twod *= 2) {
        int twod1 = twod * 2;
        const int blocks = (rounded_length/twod1 + threadsPerBlock - 1) / threadsPerBlock;
        exclusive_scan_upsweep<<<blocks, threadsPerBlock>>>(rounded_length, twod, twod1, device_result);
    }
    cudaMemset(device_result+rounded_length-1, 0, 1 * sizeof(int));
    for (int twod = rounded_length / 2; twod >= 1; twod /= 2) {
        int twod1 = twod * 2;
        const int blocks = (rounded_length/twod1 + threadsPerBlock - 1) / threadsPerBlock;
        exclusive_scan_downsweep<<<blocks, threadsPerBlock>>>(rounded_length, twod, twod1, device_result);
    }

}

/* This function is a wrapper around the code you will write - it copies the
 * input to the GPU and times the invocation of the exclusive_scan() function
 * above. You should not modify it.
 */
double cudaScan(int* inarray, int* end, int* resultarray)
{
    int* device_result;
    int* device_input; 
    // We round the array sizes up to a power of 2, but elements after
    // the end of the original input are left uninitialized and not checked
    // for correctness. 
    // You may have an easier time in your implementation if you assume the 
    // array's length is a power of 2, but this will result in extra work on
    // non-power-of-2 inputs.
    int length = end - inarray;
    int rounded_length = nextPow2(length);
    cudaMalloc((void **)&device_result, sizeof(int) * rounded_length);
    cudaMalloc((void **)&device_input, sizeof(int) * rounded_length);
    cudaMemcpy(device_input, inarray, length * sizeof(int), 
               cudaMemcpyHostToDevice);

    // For convenience, both the input and output vectors on the device are
    // initialized to the input values. This means that you are free to simply
    // implement an in-place scan on the result vector if you wish.
    // If you do this, you will need to keep that fact in mind when calling
    // exclusive_scan from find_repeats.
    cudaMemcpy(device_result, inarray, length * sizeof(int), 
               cudaMemcpyHostToDevice);
    cudaMemset(device_result+length, 0, (rounded_length - length) * sizeof(int));

    double startTime = CycleTimer::currentSeconds();

    exclusive_scan(device_input, end - inarray, device_result);

    // Wait for any work left over to be completed.
    cudaThreadSynchronize();
    double endTime = CycleTimer::currentSeconds();
    double overallDuration = endTime - startTime;
    
    cudaMemcpy(resultarray, device_result, length * sizeof(int),
               cudaMemcpyDeviceToHost);
    return overallDuration;
}
```

### Find Repeats

The performance of our find-repeats program is as follows:
```
-------------------------
Find_repeats Score Table:
-------------------------
-------------------------------------------------------------------------
| Element Count   | Target Time     | Your Time       | Score           |
-------------------------------------------------------------------------
| 10000           |                 | 0.159           | 0               |
| 100000          |                 | 0.145           | 0               |
| 1000000         |                 | 0.246           | 0               |
| 2000000         |                 | 0.414           | 0               |
-------------------------------------------------------------------------
|                                   | Total score:    | 0/5             |
-------------------------------------------------------------------------
```

Our source code is like this
```c
__global__
void convert(int *a, int *b, int length) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i + 1 < length && a[i] == a[i + 1]) {
        b[i] = 1;
    }
}

__global__
void collect(int *a, int *b, int *c, int length) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i + 1 < length && a[i] == a[i + 1]) {
        c[b[i]] = i;
    }
}

int find_repeats(int *device_input, int *t, int length, int *device_output) {
    /* Finds all pairs of adjacent repeated elements in the list, storing the
     * indices of the first element of each pair (in order) into device_result.
     * Returns the number of pairs found.
     * Your task is to implement this function. You will probably want to
     * make use of one or more calls to exclusive_scan(), as well as
     * additional CUDA kernel launches.
     * Note: As in the scan code, we ensure that allocated arrays are a power
     * of 2 in size, so you can use your exclusive_scan function with them if 
     * it requires that. However, you must ensure that the results of
     * find_repeats are correct given the original length.
     */    
    int rounded_length = nextPow2(length);
    const int threadsPerBlock = 512;
    const int blocks = (length + threadsPerBlock - 1) / threadsPerBlock;
    convert<<<blocks, threadsPerBlock>>>(device_input, t, length);
    cudaThreadSynchronize();
    exclusive_scan(nullptr, length, t);
    collect<<<blocks, threadsPerBlock>>>(device_input, t, device_output, length);
    int num;
    cudaMemcpy(&num, t + length - 1, 1 * sizeof(int), cudaMemcpyDeviceToHost);
    return num;
}

/* Timing wrapper around find_repeats. You should not modify this function.
 */
double cudaFindRepeats(int *input, int length, int *output, int *output_length) {
    int *device_input;
    int *t;
    int *device_output;
    int rounded_length = nextPow2(length);
    cudaMalloc((void **)&device_input, rounded_length * sizeof(int));
    cudaMalloc((void **)&t, rounded_length * sizeof(int));
    cudaMalloc((void **)&device_output, rounded_length * sizeof(int));
    cudaMemcpy(device_input, input, length * sizeof(int), 
               cudaMemcpyHostToDevice);

    double startTime = CycleTimer::currentSeconds();
    int result = find_repeats(device_input, t, length, device_output);

    cudaThreadSynchronize();
    double endTime = CycleTimer::currentSeconds();

    *output_length = result;

    cudaMemcpy(output, device_output, length * sizeof(int),
               cudaMemcpyDeviceToHost);

    cudaFree(device_input);
    cudaFree(t);
    cudaFree(device_output);

    return endTime - startTime;
}
```

## A Simple Circle Renderer

The score table of our code is as follows:
```
Smartmatch is experimental at ./checker.pl line 75.

--------------
Running tests on Super-Server, size = 1000, mode = cuda
--------------

Scene : rgb
Correctness passed!
Your time : 0.0887
Target Time: 

Scene : rgby
Correctness passed!

Scene : rand10k
Correctness passed!
Your time : 1.3729
Target Time: 

Scene : rand100k
Correctness passed!
Your time : 14.3591
Target Time: 

Scene : biglittle
Correctness passed!
Your time : 13.8107
Target Time: 

Scene : littlebig
Correctness passed!

Scene : pattern
Correctness passed!
Your time : 0.4229
Target Time: 

Scene : bouncingballs
Correctness passed!

Scene : hypnosis
Correctness passed!

Scene : fireworks
Correctness passed!

Scene : snow
Correctness passed!

Scene : snowsingle
Correctness passed!
Your time : 4.8847
Target Time: 

------------
Score table:
------------
-------------------------------------------------------------------------
| Scene Name      | Target Time     | Your Time       | Score           |
-------------------------------------------------------------------------
| rgb             |                 | 0.0887          | 2               |
| rand10k         |                 | 1.3729          | 2               |
| rand100k        |                 | 14.3591         | 2               |
| pattern         |                 | 0.4229          | 2               |
| snowsingle      |                 | 4.8847          | 2               |
| biglittle       |                 | 13.8107         | 2               |
-------------------------------------------------------------------------
|                                   | Total score:    | 12/72           |
-------------------------------------------------------------------------
```

```c
#define BLOCKHEIGHT 32
#define BLOCKWIDTH 32
#define BLOCKSIZE 1024
#define SCAN_BLOCK_DIM   BLOCKSIZE
#include "exclusiveScan.cu_inl"
__global__ void kernelRenderCircles(int *blockCircles, int *tempBlockCircles) {
    int width = cuConstRendererParams.imageWidth, height = cuConstRendererParams.imageHeight;
    int lidx = threadIdx.y * blockDim.y + threadIdx.x;
    int numCirclesPerT = (cuConstRendererParams.numCircles + BLOCKSIZE - 1) / BLOCKSIZE;
    int sIdx = lidx * numCirclesPerT, eIdx = min(sIdx + numCirclesPerT, cuConstRendererParams.numCircles);
    int blkMinY = blockIdx.y * gridDim.y,
        blkMinX = blockIdx.x * gridDim.x,
        blkMaxY = min(blkMinY + gridDim.y, height),
        blkMaxX = min(blkMinX + gridDim.x, width);
    int blkId = blockIdx.x + gridDim.y * blockIdx.y;
    int *threadTBC = tempBlockCircles + blkId * cuConstRendererParams.numCircles + sIdx;
    uint numOfInterestCircles = 0;
    for (int index = sIdx; index < eIdx; index++) {
        int index3 = 3 * index;
        float3 p = *(float3*)(&cuConstRendererParams.position[index3]);
        float  rad = cuConstRendererParams.radius[index];

        short imageWidth = cuConstRendererParams.imageWidth;
        short imageHeight = cuConstRendererParams.imageHeight;
        short minX = static_cast<short>(imageWidth * (p.x - rad));
        short maxX = static_cast<short>(imageWidth * (p.x + rad)) + 1;
        short minY = static_cast<short>(imageHeight * (p.y - rad));
        short maxY = static_cast<short>(imageHeight * (p.y + rad)) + 1;
        // printf("%d,%d,%d,%d - %d,%d,%d,%d\n", blkMinX, blkMinY, blkMaxX, blkMaxY, minX, minY, maxX, maxY);
        if (blkMinX >= maxX || blkMinY >= maxY || blkMaxX <= minX || blkMaxY <= minY) {
            continue;
        }
        threadTBC[numOfInterestCircles++] = index;
    }

    __shared__ uint prefixSumInput[BLOCKSIZE];
    __shared__ uint prefixSumOutput[BLOCKSIZE];
    __shared__ uint prefixSumScratch[2 * BLOCKSIZE];
    prefixSumInput[lidx] = numOfInterestCircles;
    __syncthreads();
    sharedMemExclusiveScan(lidx, prefixSumInput, prefixSumOutput, prefixSumScratch, BLOCKSIZE);
    __shared__ int blkNumofInterestCircles[1];
    if (lidx == BLOCKSIZE - 1) {
        blkNumofInterestCircles[0] = prefixSumOutput[lidx] + numOfInterestCircles;
    }
    __syncthreads();
    int *threadBC = blockCircles + blkId * cuConstRendererParams.numCircles;
    for (int i = 0; i < numOfInterestCircles; i++) {
        threadBC[i + prefixSumOutput[lidx]] = threadTBC[i];
    }
    __syncthreads();
    int yIdx = blockIdx.y * blockDim.y + threadIdx.y,
        xIdx = blockIdx.x * blockDim.x + threadIdx.x;
    if (xIdx >= width || yIdx >= height) return;
    float invWidth = 1.f / width;
    float invHeight = 1.f / height;
    float2 pixelCenterNorm = make_float2(invWidth * (static_cast<float>(xIdx) + 0.5f),
                                                    invHeight * (static_cast<float>(yIdx) + 0.5f));
    float4* imgPtr = (float4*)(&cuConstRendererParams.imageData[4 * (yIdx * width + xIdx)]);
    for (int i = 0; i < blkNumofInterestCircles[0]; i++) {
        int index = threadBC[i];
        int index3 = 3 * index;
        float3 p = *(float3*)(&cuConstRendererParams.position[index3]);
        shadePixel(index, pixelCenterNorm, p, imgPtr);
    }
}
void
CudaRenderer::render() {

    // 256 threads per block is a healthy number
    dim3 blockDim(BLOCKHEIGHT, BLOCKWIDTH, 1);
    dim3 gridDim((image->width + blockDim.x - 1) / blockDim.x, (image->height + blockDim.y - 1) / blockDim.y);
    int *blockCircles,
        *tempBlockCircles;
    cudaMalloc(&blockCircles, BLOCKHEIGHT * BLOCKWIDTH * numCircles * sizeof(int));
    cudaMalloc(&tempBlockCircles, BLOCKHEIGHT * BLOCKWIDTH * numCircles * sizeof(int));
    kernelRenderCircles<<<gridDim, blockDim>>>(blockCircles, tempBlockCircles);
    cudaDeviceSynchronize();
}
```