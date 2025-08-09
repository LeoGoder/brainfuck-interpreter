#pragma once

#define NB_INPUT_INCORRECT 1
#define FILE_FORMAT_INCORRECT 2
#define CHAR_FORBIDDEN_INPUT_INCORRECT 3

int error_nb_input_handler(int argc);
int check_if_file_bf(char *argv);