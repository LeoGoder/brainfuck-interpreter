#include <stdio.h>
#include <stdlib.h>

//oui
int interpreter_size(char *argv)
{
    int size = 0;
    int i = 0;

    while (argv[i])
    {
        if (argv[i] == '>')
            size++;
        if (argv[i] == '<')
            size--;
        i++;
    }
    if (size < 0)
        {
            printf("out-of-bounds error");
            return -1;
        }
    return size;
}

int *init_interpreter(int size, int *ptr)
{
    int i = 0;
    while (i < size)
    {
        ptr[i] = 0;
        i++;
    }
    
    return ptr;
}

void    interpreter_rules(char *argv, int *cursor, int *i, int *ptr)
{
    int temp;
    if (argv[*i] == '>')
        *cursor += 1;
    if (argv[*i] == '<')
        *cursor -= 1;
    if (argv[*i] == '+')
        ptr[*cursor]++;
    if (argv[*i] == '-')
        ptr[*cursor]--;
    if (argv[*i] == '.')
        putchar(ptr[*cursor]);
    if (argv[*i] == '[')
        temp = *i;
    if (argv[*i] == ']')
    {
        if (ptr[*cursor] != 0)
            *i = temp;
    }
}

int intepreter(char *argv)
{
    int *ptr;
    int size = 0;
    int i = 0;
    int cursor = 0;

    size = interpreter_size(argv);
    if (size < 0)
        return -1;
    ptr = malloc(size * sizeof(int) + 1);
    init_interpreter(size, ptr);
    while (argv[i])
    {
        interpreter_rules(argv, &cursor, &i , ptr);
        i++;
    }
    return 0;
}