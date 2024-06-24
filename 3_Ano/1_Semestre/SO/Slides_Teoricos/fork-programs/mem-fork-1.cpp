#include    <stdio.h>
#include    <stdlib.h>
#include    <unistd.h>
#include    <alloca.h>
#include    <wait.h>

int n1 = 1;
static int n2 = 2;
int n3;
static int n4;
int n5;
static int n6 = 6;

int main(int argc, char *argv[], char *env[])
{
    if (fork() != 0) 
    {
        fprintf(stderr, "n1 = %d\n", n1);
        wait(NULL);
        fprintf(stderr, "================\n");
        fprintf(stderr, "n1 = %d\n", n1);
        fprintf(stderr, "================\n");
    }
    else 
    {
        n1 = 1111;
        fprintf(stderr, "n1 = %d\n", n1);
    }
    extern char** environ;
    static int n7;
    static int n8 = 8;
    int *n9 = (int*)malloc(sizeof(int));
    int *n10 = (int*)malloc(sizeof(int));
    int *n11 = (int*)alloca(sizeof(int));
    int n12;
    int n13 = 13;
    int n14;
    printf("\ngetenv(n0) = %p\n", getenv("n0"));
    printf("\nargv = %p\nenviron = %p\nenv = %p\nmain = %p\n",
            argv, environ, env, main);
    printf("\n&argc = %p\n&argv = %p\n&argv[0] = %p\n",
                &argc, &argv, &argv[0]);
    printf("\n&n1 = %p\n&n2 = %p\n&n3 = %p\n&n4 = %p\n&n5 = %p\n"
                "&n6 = %p\n&n7 = %p\n&n8 = %p\nn9 = %p\nn10 = %p\n"
                "n11 = %p\n&n12 = %p\n&n13 = %p\n&n14 = %p\n", 
            &n1, &n2, &n3, &n4, &n5, &n6, &n7, &n8, 
            n9, n10, n11, &n12, &n13, &n14);

    return EXIT_SUCCESS;
}
