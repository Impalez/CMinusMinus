

#include <stdio.h>
#include "symbols.h"
#include <errno.h>

extern FILE* yyin;
extern int yylex(void);

const char* lexUnits[] = { "END",
                           "INT",
                           "BOOL",
                           "VOID",
                           "TRUE",
                           "FALSE",
                           "IF",
                           "ELSE",
                           "WHILE",
                           "RETURN",
                           "CIN",
                           "COUT",
                           "IDENTIFIER",
                           "INTEGER_LITERAL",
                           "STRING_LITERAL",
                           "CONSTANT",
                           "NUM",
                           "LBRACE",
                           "RBRACE",
                           "LPAREN",
                           "RPAREN",
                           "LBRACK",
                           "RBRACK",
                           "COMMA",
                           "ASSIGN",
                           "END_OF_INSTRUCTION",
                           "ADD",
                           "SUBSTRACT",
                           "TIMES",
                           "OVER",
                           "NOT",
                           "AND",
                           "OR",
                           "EQ",
                           "NEQ",
                           "LT",
                           "GT",
                           "LTE",
                           "GTE",
                           "RIGHT",
                           "LEFT" };
                    

int main()
{
    int tokenValue = 0;
    yyin = fopen("input.csrc", "rt");

    if (yyin != NULL)
    {
        while ((tokenValue = yylex()) != END)
        {
            printf(" -> TOKEN ID: %d; TOKEN VALUE: %s \n", tokenValue, lexUnits[tokenValue]);
        }
        printf("\n\n Hello World!\n");
    }
    else
    {
        printf("Fisierul de intrare nu poate fi deschis. Eroare: %d", errno);
    }
}

