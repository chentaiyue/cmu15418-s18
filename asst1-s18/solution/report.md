# s18 Asst1

My machine contains

1. 6 Intel(R) Xeon(R) W-2235 CPU @ 3.80GHz (6 cores, 12 threads);
2. 1 Nvidia GeForce RTX 3090 24GB;

To complete this assignment, we need to download and install the ispc package.

1. download the ispc binary package (v1.9.1);
2. unzip this package (`tar -zxvf your_download_dir/ispc-v1.9.1b-linux.tar.gz`) to the dir `/usr/local/bin`;

now, we can type `ispc --version` into the cmd line and then get the info as follows, which means ur environment has been setup successfully:

```
Intel(r) SPMD Program Compiler (ispc), 1.9.1 (build commit 87d0c9a2ed7c9d0e @ 20200401, LLVM 3.8)
```

## Parallel Fractal Generation Using Pthreads

This problem requires u that use the pthreads to parallelize the computation of the images. All modified codes are in the file `prog1_mandelbrot_threads/mandelbrot.cpp`.

To complete this work,

1. we first need to extract the parallelizable code segments into a serial of tasks;

```c
// #line 155 in `mandelbrot.cpp`
for (int i=0; i<numThreads; i++) {
    // TODO: Set thread arguments here.
    args[i].x0 = x0;
    args[i].x1 = x1;
    args[i].y0 = y0;
    args[i].y1 = y1;
    args[i].width = width;
    args[i].height = height;
    args[i].maxIterations = maxIterations;
    args[i].output = output;
    args[i].threadId = i;
    args[i].numThreads = numThreads;
}
```

2. then, we take the blocking strategy to assign the tasks for each thread.

```c
// #line 125 in `mandelbrot.cpp`
int step = (args->height + args->numThreads - 1) / args->numThreads;
int startRow = step * args->threadId, endRow = step * (args->threadId + 1);
if (endRow > args->height) {
    endRow = args->height;
}
mandelbrotSerial(args->x0, args->y0, 
                args->x1, args->y1, 
                args->width, args->height,
                startRow, endRow - startRow,
                args->maxIterations,
                args->output);
```

The speedup of the blocking assignment strategy is as follows:

|   Num   | 1     | 2    | 3     | 4     | 5     | 6     | 7     | 8     | 9     | 10    | 11    | 12    |
| :-----: | ----- | ---- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
|  Time  | 165ms | 97ms | 128ms | 82ms  | 87ms  | 61ms  | 58ms  | 55ms  | 49ms  | 45ms  | 39ms  | 35ms  |
| Speedup | 1x    | 1.7x | 1.3x  | 2.01x | 1.89x | 2.72x | 2.83x | 2.98x | 3.38x | 3.64x | 4.23x | 4.74x |

The speedup of this strategy is not scaled perfect with the num of the threads. Bedides, we notice a sentence "*white pixels required the maximum (256) number of iterations, black ones only a few iterations, and gray pixels were somewhere in between*". Thus, we guess this assignment strategy may lead to the huge work-load imbalance among the worker threads. So, we take the interleaved  assignment strategy:

```c
for (int i = args->threadId; i < args->height; i += args->numThreads) {
        mandelbrotSerial(args->x0, args->y0, 
                    args->x1, args->y1, 
                    args->width, args->height,
                    i, 1,
                    args->maxIterations,
                    args->output);
    }

```

The speedup of this interleaving assignment is as follows:

|   Num   | 1     | 2     | 3     | 4     | 5     | 6     | 7     | 8     | 9     | 10    | 11    | 12    |
| :-----: | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
|  Time  | 165ms | 99ms  | 74ms  | 51ms  | 41ms  | 38ms  | 34ms  | 30ms  | 25ms  | 22ms  | 21ms  | 20ms  |
| Speedup | 1x    | 1.66x | 2.24x | 3.21x | 3.96x | 4.27x | 4.82x | 5.46x | 6.63x | 7.49x | 7.77x | 8.07x |

From this table, we can conclude that the interleaving assignment strategy can have more balanced workload.

## Vectorizing Code Using SIMD Intrinsics

This problems requires u to use some fake functions to mock the SSE or AVX vector instrinsics to parallelize the computation of the code.

```c
void clampedExpVector(float* values, int* exponents, float* output, int N) {
    // Implement your vectorized version of clampedExpSerial here
    //  ...
	int i = 0;
	__cmu418_vec_float x;
	__cmu418_vec_float result;
	__cmu418_vec_int y;
	__cmu418_vec_float xpower;

	__cmu418_vec_int y0, y1, yand0;
	__cmu418_vec_float result418;
	__cmu418_mask ygt0;
	__cmu418_mask mall = _cmu418_init_ones();
	__cmu418_mask resultgt418;
	_cmu418_vset_int(y0, 0, mall);
	_cmu418_vset_int(y1, 1, mall);
	_cmu418_vset_float(result418, 4.18f, mall);
	// calc VECTOR_WIDTH elements for each iteration
	for (; i + VECTOR_WIDTH <= N; i += VECTOR_WIDTH) {
		_cmu418_vload_float(x, values+i, mall);
		_cmu418_vset_float(result, 1.f, mall);
		_cmu418_vload_int(y, exponents+i, mall);
		_cmu418_vload_float(xpower, values+i, mall);
		_cmu418_vgt_int(ygt0, y, y0, mall);
		while (_cmu418_cntbits(ygt0) > 0) {
			_cmu418_vbitand_int(yand0, y, y1, mall);
			_cmu418_vgt_int(ygt0, yand0, y0, mall);
			_cmu418_vmult_float(result, result, xpower, ygt0);
			_cmu418_vmult_float(xpower, xpower, xpower, mall);
			_cmu418_vshiftright_int(y, y, y1, mall);
			_cmu418_vgt_int(ygt0, y, y0, mall);
		}
		_cmu418_vgt_float(resultgt418, result, result418, mall);
		_cmu418_vset_float(result, 4.18f, resultgt418);
		_cmu418_vstore_float(output + i, result, mall);
	}
	clampedExpSerial(values+i, exponents+i, output+i, N-i);
}
```

The relations of the vector width and the vector utilization are summarized as follows:

| VecWidth       | 2      | 4      | 8      | 16     | 32     |
| -------------- | ------ | ------ | ------ | ------ | ------ |
| VecUtilization | 90.62% | 90.37% | 90.32% | 90.31% | 90.31% |
| TotVecIns      | 286613 | 146698 | 73738  | 36878  | 18411  |

Although the vector utilization are similar, the number of the vector instruction is inversely proportional to the vector width.

## Parallel Fractal Generation Using ISPC

This problems requires u to use ISPC to to parallelize the computation of the code.

Q1: What is the maximum speedup you expect given what you know about these CPUs? Why might the number you observe be less than this ideal?

> I get 4.26x, 3.75x, 4.45x, 4.4x, 3.88x, 4.23x speedup for the view 1-6, respectively. The 8-wide AVX2 vector instructions simutaneously evaluate multiple data once, there may exist workload imbalance within one execuation. So, it is hard to arrive the perfect speedup.

Q2: when threadCount=2, the speedup is 6.06 (about 1.5x than that of threadCount=1):

```
[mandelbrot serial]:            [179.352] ms
Wrote image file mandelbrot-serial.ppm
[mandelbrot ispc]:              [42.595] ms
Wrote image file mandelbrot-ispc.ppm
[mandelbrot multicore ispc]:    [29.609] ms
Wrote image file mandelbrot-task-ispc.ppm
                                (4.21x speedup from ISPC)
                                (6.06x speedup from task ISPC)
```

Q3, you should modify lines 71-72 in `mandelbrot.isp`,

```c
uniform int threadCount = 2;
uniform int rowsPerTask = (height + threadCount - 1) / threadCount;
```

| threadCount | 2     | 4     | 8      | 16     | 32     | 64     | 128    | 256    | 512    |
| :---------: | ----- | ----- | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
|   Speedup   | 6.06x | 8.44x | 12.03x | 25.09x | 36.92x | 37.81x | 39.84x | 39.66x | 38.14x |

The speedup of the normal ispc code is about 4x, and the multi-thread version of the ispc code with `threadCount=2` is about 6x. Thus, we guess when threadCount is equal to 16, the speedup of the multi-thread version is about 20-22. And the result strongly domenstrates this idea.

> As for Q3, i think the *task* in ispc is a kind of light-weight (hardware-level) thread (like a physical thread in cuda).

## Iterative Square Root

Q1: The speedup due to the SIMD parallelization is 4.2x, and the speedup due to multi-core parallelization is 39.78x.
```
[sqrt serial]:          [686.270] ms
[sqrt ispc]:            [163.225] ms
[sqrt task ispc]:       [17.251] ms
                                (4.20x speedup from ISPC)
                                (39.78x speedup from task ISPC)
```

Q2: When we use the function `initGood` to initialize all data, we can find that the time consumption of the serial code reduces to 21ms.
```
[sqrt serial]:          [21.894] ms
[sqrt ispc]:            [10.984] ms
[sqrt task ispc]:       [3.923] ms
                                (1.99x speedup from ISPC)
                                (5.58x speedup from task ISPC)
```
I guess due to a good initial value, the function `sqrt` can converge quickly, and have more even workload. Thus, it can greatly reduce the time consumption of all three kinds of the `sqrt` code.

Q3: just let the workload imbalance:
```c
values[i] = 1.0f;
if (i % 8 == 0) {
	values[i] = 2.999f;
}
```
The speedup of the modified code is as follows:
```
[sqrt serial]:          [242.628] ms
[sqrt ispc]:            [282.693] ms
[sqrt task ispc]:       [31.876] ms
                                (0.86x speedup from ISPC)
                                (7.61x speedup from task ISPC)
```

## BLAS saxpy

Q1: The speedup of the ISPC code is only 1.15x. Besides, I notice that both the serial code and the ispc code reach to the memory bandwidth wall. Thus, I guess the memory bandwidth has become the bottleneck. Unless we improve the memory bandwidth, it is hard to further accelerate the code.
```
[saxpy serial]:         [17.781] ms     [16.761] GB/s   [1.125] GFLOPS
[saxpy streaming]:      [15.774] ms     [18.894] GB/s   [1.268] GFLOPS
[saxpy ispc]:           [15.484] ms     [19.247] GB/s   [1.292] GFLOPS
[saxpy task ispc]:      [5.301] ms      [56.223] GB/s   [3.773] GFLOPS
                                (1.13x speedup from streaming)
                                (1.15x speedup from ISPC)
                                (3.35x speedup from task ISPC)
```
> Why the speedup of the task ispc is more than 3x? This is mainly due to the multiple channels which could further improve the memory bandwidth.

Q2: `result[i] = scale * X[i] + Y[i]`, we need to load `result[i]`, `X[i]` and `Y[i]` first, which leads to loading 3 * N * sizeof(float) bytes, and then we need to write `result[i]` to the memory, which leads to loading 1 * N * sizeof(float) bytes. In conclusion, it leads to loading 4 * N * sizeof(float) bytes.

Q3:
```
__m128 sp = _mm_set_ps1(scale);
__m128* x = (__m128*)X, *y = (__m128*)Y;
int i;
for (i = 0; i + 4 < N; i += 4) {
    _mm_stream_ps(result + i, _mm_add_ps(_mm_mul_ps(sp, *x), *y));
    x++;
    y++;
}
while (i < N) {
    result[i] = scale * X[i] + Y[i];
    i++;
}
```

```
[saxpy serial]:         [16.951] ms     [17.581] GB/s   [1.180] GFLOPS
[saxpy streaming]:      [12.479] ms     [23.881] GB/s   [1.603] GFLOPS
[saxpy ispc]:           [15.123] ms     [19.707] GB/s   [1.323] GFLOPS
[saxpy task ispc]:      [5.333] ms      [55.884] GB/s   [3.750] GFLOPS
                                (1.36x speedup from streaming)
                                (1.12x speedup from ISPC)
                                (3.18x speedup from task ISPC)
```

