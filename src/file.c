#include <stdio.h>
#include <stdlib.h>
#include "interpreter.h"

char *file_to_tab(char *argv)
{
    int i = 0;
    int c = 0;
    long file_size;
    char *content;
    FILE *input_file;
    
    input_file = fopen(argv, "r");
    if (input_file == NULL)
    {
        printf("cannot open file");
        return NULL;
    }
    fseek(input_file, 0, SEEK_END);
    file_size = ftell(input_file);
    fseek(input_file, 0, SEEK_SET);
    content = malloc(file_size * sizeof(char) + 1);
    while ((c = fgetc(input_file)) != EOF)
    {
        content[i] = (char)c;
        i++;
    }
    content[i] = '\0';
    fclose(input_file);
    intepreter(content);
    free(content);
    return content;
}