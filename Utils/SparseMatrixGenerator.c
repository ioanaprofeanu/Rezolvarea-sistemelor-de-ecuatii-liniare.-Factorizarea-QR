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

    // create sparse matrix A
    for (int i = 0; i < m; i++) {
        // generate 4 random  numbers, which will be used to
        // get random indices for the non-zero elements of the
        // sparse matrix
        int index = rand() % n;
        int index2 = rand() % n;
        int index3 = rand() % n;
        int index4 = rand() % n;
        for (int j = 0; j < n; j++) {
            // using the indexes, create random non-zero elements
            if (i % 10 == 1 && j == index2) {
                A[i][j] = ((float)rand()/(float)(RAND_MAX)) * a;
            } else if (i % 52 == 1 && j == index3) {
                A[i][j] = ((float)rand()/(float)(RAND_MAX)) * b;
            } else if (i % 120 == 2 && j == index4) {
                A[i][j] = ((float)rand()/(float)(RAND_MAX)) * a;
            } else if (index == j) {
                A[i][j] = A[i][j] = ((float)rand()/(float)(RAND_MAX)) * b;
            // make sure the main diagonal has non-zero elements
            } else if (i == j) {
                A[i][j] = ((float)rand()/(float)(RAND_MAX)) * a;
            // make the element 0 if it outside of the other cases
            } else {
                A[i][j] == 0;
            }
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

