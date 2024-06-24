#include    <stdio.h>
#include    <stdlib.h>
#include    <unistd.h>
#include    <alloca.h>
#include    <errno.h>

int n01 = 1;
static int n02 = 2;
int n03;
static int n04;
int n05;
static int n06 = 6;


void f2();

void f1(int i) 
{
    *(&n01 + i) = 3333;
}

int main(int argc, char *argv[], char *env[])
{
    extern char** environ;
    static int n07;
    int n08 = 8;
    int *p09 = (int*)malloc(sizeof(int));
    int *p10 = new int;
    int *p11 = (int*)alloca(sizeof(int));
    int n12;
    static int n13 = 13;
    int n14;
    int n15;

    printf("sizeof(int): %ld bytes\n", sizeof(int));
    printf("sizeof(long): %ld bytes\n", sizeof(long));
    printf("sizeof(void*): %ld bytes\n", sizeof(void*));
    printf("\n");

    printf("env: %p\n", env);
    printf("environ: %p [offset to env: %ld]\n", environ, environ - env);
    printf("\n");

    printf("env[0]: %p (offset to env: %ld)\n", env[0], (char*)env[0]-(char*)env);
    for (int i = 0; env[i] != NULL; i++)
    {
        printf("env[%2d] (offset to env[0]: %ld) %s\n", i, env[i]-env[0], env[i]);
    }
    printf("\n");

    printf("getenv(n0) = %s\n", getenv("n0"));
    printf("getenv(HOME) = %s\n", getenv("HOME"));
    printf("\n");

    printf("argv[0]: %p (offset to argv: %ld)\n", argv[0], (char*)argv[0]-(char*)argv);
    for (int i = 0; argv[i] != NULL; i++)
    {
        printf("argv[%2d] (offset to argv[0]: %ld) %s\n", i, argv[i]-argv[0], argv[i]);
    }
    printf("\n");

    printf("env: %p\n", &env);
    printf("argv: %p -- offset to env: %ld (%ld)\n", &argv, &argv-&env, (char*)&argv-(char*)&env);
    printf("argc: %p -- offset to argv: (%ld)\n", &argc, (char*)&argc-(char*)&argv);
    printf("\n");

    printf("main: %p\n", main);
    printf("f1: %p (offset to main: %ld)\n", f1, (char*)f1-(char*)main);
    printf("f2: %p (offset to main: %ld)\n", f2, (char*)f2-(char*)main);
    printf("\n");

//    printf("&n01: %p (offset to f1: %ld)\n", &n01, (char*)&n01-(char*)f1);

    printf("n01: %-12d [addr: %p]\n", n01, &n01);
    printf("n02: %-12d [addr: %p] offset to n01: %ld (%ld)\n", n02, &n02, &n02-&n01, (char*)&n02-(char*)&n01);
    printf("n06: %-12d [addr: %p] offset to n01: %ld (%ld)\n", n06, &n06, &n06-&n01, (char*)&n06-(char*)&n01);
    printf("n13: %-12d [addr: %p] offset to n01: %ld (%ld)\n", n13, &n13, &n13-&n01, (char*)&n13-(char*)&n01);
    printf("\n");

    printf("n03: %-12d [addr: %p] offset to n01: %ld (%ld)\n", n03, &n03, &n03-&n01, (char*)&n03-(char*)&n01);
    printf("n05: %-12d [addr: %p] offset to n01: %ld (%ld)\n", n05, &n05, &n05-&n01, (char*)&n05-(char*)&n01);
    printf("n04: %-12d [addr: %p] offset to n01: %ld (%ld)\n", n04, &n04, &n04-&n01, (char*)&n04-(char*)&n01);
    printf("n07: %-12d [addr: %p] offset to n01: %ld (%ld)\n", n07, &n07, &n07-&n01, (char*)&n07-(char*)&n01);
    printf("\n");

    printf("n08: %-12d [addr: %p] offset to argc: (%ld)\n", n08, &n08, (char*)&n08-(char*)&argc);
    printf("n12: %-12d [addr: %p] offset to n08: %ld (%ld)\n", n12, &n12, &n12-&n08, (char*)&n12-(char*)&n08);
    printf("n14: %-12d [addr: %p] offset to n08: %ld (%ld)\n", n14, &n14, &n14-&n08, (char*)&n14-(char*)&n08);
    printf("n15: %-12d [addr: %p] offset to n08: %ld (%ld)\n", n15, &n15, &n15-&n08, (char*)&n15-(char*)&n08);
    printf("\n");

    printf("p11: %-12d [addr: %p] offset to n08: %ld (%ld)\n", *p11, p11, p11- &n08, (char*)p11- (char*)&n08);
    printf("\n");

    printf("p09: %-12d [addr: %p] offset to f2: (%ld)\n", *p09, p09, (char*)p09- (char*)f2);
    printf("\n");

    printf("p10: %-12d [addr: %p] offset to p09: %ld (%ld)\n", *p10, p10, p10-p09, (char*)p10- (char*)p09);
    printf("\n");

    printf("\n");

    f1(3000);
    printf("n13: %-12d [addr: %p] [addr offset to n01: %ld]\n", n13, &n13, &n13-&n01);
    printf("\n");

    return EXIT_SUCCESS;
}

void f2() 
{
}

