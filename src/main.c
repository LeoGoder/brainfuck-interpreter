#include "error.h"
#include "interpreter.h"
#include "file.h"

int main(int argc, char **argv)
{
    if (error_nb_input_handler(argc) != 0)
        return 1;
    if (check_if_file_bf(argv[1]) == 2)
        intepreter(file_to_tab(argv[1]));
    else
        intepreter(argv[1]);
    return 0;
}