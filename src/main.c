#include "error.h"
#include "interpreter.h"

int main(int argc, char **argv)
{
    if (error_nb_input_handler(argc) != 0)
        return 1;
    intepreter(argv[1]);
    return 0;
}