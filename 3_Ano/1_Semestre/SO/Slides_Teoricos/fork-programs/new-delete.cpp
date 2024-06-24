#include <iostream>
#include <malloc.h>

using namespace std;

int main()
{
    int * p = new int;

    int * q = (int*)calloc(1, sizeof(int));

    free(p);

    delete q;

    cerr << "==============\n";

    free(q);
    free(q);
    delete p;
    delete p;

    return 0;
}
