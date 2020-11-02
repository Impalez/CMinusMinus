#include <stdio.h>
#include "c.tab.h"
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
    yydebug = 1;
    yyin = fopen("input.csrc", "rt");

    if (yyin != NULL)
    {
        int result = yyparse();
        switch (result)
        {
        case 0:
            printf("Parse succesfully. \n");
            break;
        
        case 1:
            printf("Invalid input encountered. \n");
            break;

        case 2:
            printf("Out of memory. \n");
            break;

        default:
            break;
        }
        fclose(yyin);
    }
    else
    {
        printf("Inexistent file. \n");
    }

}

