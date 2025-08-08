#include "error.h"

int error_nb_input_handler(int argc)
{
    if (argc < 2 || argc > 2)
        return NB_INPUT_INCORRECT;
    return 0;
}

// verif que fichier est un .bf

// verif que l'input ne contient aucun char indesirable