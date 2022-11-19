// Profeanu Ioana, 323CA
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main()
{
    srand(time(NULL));
    int m, n, a, b;
    float A[1000][1000], B[1000][2];
    // read the dimensions of the A matrix and 2 random numbers
    scanf("%d %d", &m, &n);
    scanf("%d %d", &a, &b);

    // create A matrix
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            // generate number number
            A[i][j] = ((float)rand()/(float)(RAND_MAX)) * a;
        }
    }

    // create B matrix
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < 1; j++) {
            B[i][j] = ((float)rand()/(float)(RAND_MAX)) * b;
        }
    }

    // print the A matrix
    printf("%d %d\n", m, n);
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            printf("%f ", A[i][j]);
        }
        printf("\n");
    }

    // print the b column vector
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < 1; j++) {
            printf("%f ", B[i][j]);
        }
        printf("\n");
    }

    return 0;
}

