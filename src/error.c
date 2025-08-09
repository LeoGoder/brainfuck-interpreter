#include <string.h>
#include <stdio.h>
#include "error.h"

int error_nb_input_handler(int argc)
{
    if (argc < 2 || argc > 2)
        return NB_INPUT_INCORRECT;
    return 0;
}

// verif que fichier est un .bf
int check_if_file_bf(char *argv)
{
    int i = 0;
    char *bf = ".bf";
    int y;
    int len;
    int found = 0;

    while (argv[i])
    {
        if (argv[i] == '.')
        {
            y = 0;
            while (bf[y])
            {
                if (argv[i + y] == bf[y])
                    len++;
                y++;
            }
            if (len != y)
            {
                printf("file extensions not good ");
                return 1;
            }
        }
        i++;
    }
    return 0;
}
// verif que l'input ne contient aucun char indesirable