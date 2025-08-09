#include "error.h"
#include "interpreter.h"
#include "file.h"

int main(int argc, char **argv)
{
    int i = 0;
    if (error_nb_input_handler(argc) != 0)
        return 1;
    if (check_if_file_bf(argv[1]) == 1)
        return 1;
    char *content = file_to_tab(argv[1]);
    
    //intepreter(content);
    return 0;
}