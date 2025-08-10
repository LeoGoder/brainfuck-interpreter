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
int check_if_file_bf(char *filename)
{
    int len_filename = strlen(filename);
    int len_extension = 3; 

    if (len_filename < len_extension) {
        printf("Nom de fichier trop court.\n");
        return 1;
    }
    if (strcmp(filename + len_filename - len_extension, ".bf") == 0) {
        return 2;
    } 
    return 1;
}
// verif que l'input ne contient aucun char indesirable