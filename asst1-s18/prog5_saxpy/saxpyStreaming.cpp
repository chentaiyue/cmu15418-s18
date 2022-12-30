#include <smmintrin.h> // For _mm_stream_load_si128
#include <emmintrin.h> // For _mm_mul_ps
#include <assert.h>
#include <stdint.h>
#include <stdio.h>
extern void saxpySerial(int N,
			float scale,
			float X[],
			float Y[],
			float result[]);


void saxpyStreaming(int N,
                    float scale,
                    float X[],
                    float Y[],
                    float result[])
{
    // Replace this code with ones that make use of the streaming instructions
    // saxpySerial(N, scale, X, Y, result);

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
}

