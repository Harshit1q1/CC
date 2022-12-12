/*
To implement a Type Checker.: Extend experiment 5 to assign Data type to each identifier
as per declaration statement. Verify Data type as per each programming construct
and report appropriate error message.
*/

#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n, flag = 0;
    char variable[15], type[15], b[15], c, percent='%';

    printf("\nGrammar for given statements: \n");
    printf("E -> E+E | E-E | E*E | E/E | E%cE | -E | (E) | NUMBER\n\n", percent);

    printf("Enter the number of variables : ");
    scanf("%d", &n);
    
    for (int i = 0; i < n; i++)
    {
        printf("Enter the variable[%d] : ", i);
        scanf(" %c", &variable[i]);
        printf("Enter the variable data-type[%d] (float-f, int-i) : ", i);
        scanf(" %c", &type[i]);
        if (type[i] == 'f')
            flag = 1;
    }

    int expr_len = 0;

    printf("\nEnter the Expression(end with $) : ");
    getchar();
    while ((c = getchar()) != '$')
        b[expr_len++] = c;

    for (int i = 0; i < expr_len; i++)
    {
        if (b[i] == '/')
        {
            flag = 1;
            break;
        }
    }

    for (int i = 0; i < n; i++)
    {
        if (b[0] == variable[i])
        {
            if (flag == 1)
            {
                if (type[i] == 'f')
                    printf("\nThe datatype is correctly defined!\n\n");
                else
                    printf("\nIdentifier '%c' must be of float type!\n\n", variable[i]);
            }
            else
                printf("\nThe datatype is correctly defined!\n\n");
            break;
        }
    }
    return 0;
}

/*
5
a
f
b
i
c
i
d
f
e
f
a=(-b/c)*(d%e)$

3
x
f
y
i
z
i
x=y/z$

3
x
i
y
i
z
i
x=y/z$
*/