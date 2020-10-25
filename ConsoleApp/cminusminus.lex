D			[0-9]
L			[a-zA-Z_]
IS			(u|U|l|L)*

%{
#include <stdio.h>
#include "symbols.h"

void warning();
void count();
%}

%%
"//"			{ comment(); }
"#"				{ comment(); }

"int"				{ count(); return(INT); }
"bool"			{ count(); return(BOOL); }
"void"			{ count(); return (VOID); }
"if"				{ count(); return(IF); }
"else"			{ count(); return(ELSE); }
"while"			{ count(); return(WHILE); }
"return"		{ count(); return(RETURN); }
"cin"				{ count(); return(CIN);}
"cout"			{ count(); return(COUT);}

{L}({L}|{D})*		{ count(); return(check_type()); }
0{D}+{IS}?			{ count(); return(CONSTANT); }
{D}+{IS}?				{ count(); return(CONSTANT); }

L?\"(\\.|[^\\"])*\"	{ count(); return(STRING_LITERAL); }


"{"			{ count(); return(LBRACE); }
"}"			{ count(); return(RBRACE); }
"("			{ count(); return(LPAREN); }
")"			{ count(); return(RPAREN); }
"["			{ count(); return(LBRACK); }
"]"			{ count(); return(RBRACK); }
","			{ count(); return(COMMA); }
"="			{ count(); return(ASSIGN); }
";"			{ count(); return (END_OF_INSTRUCTION);}
"+"			{ count(); return(ADD); }
"-"			{ count(); return(SUBSTRACT); }
"*"			{ count(); return(TIMES); }
"/"			{ count(); return(OVER); }
"!"			{ count(); return(NOT); }
"&&"		{ count(); return(AND); }
"||"		{ count(); return(OR); }
"=="		{ count(); return(EQ); }
"!="		{ count(); return(NEQ); }
"<"			{ count(); return(LT); }
">"			{ count(); return(GT); }
"<="		{ count(); return(LTE); }
">="		{ count(); return(GTE); }
"<<"		{ count(); return(RIGHT); }
">>"		{ count(); return(LEFT); }



[ \t\v\n\f]+
.			{ warning(); }

%%

yywrap()
{
	return(1);
}

void warning()
{
	printf("The string %s is not recognized" , yytext);
}

comment()
{
	char c, c1;

loop:
	while ((c = input()) != '*' && c != 0)
		putchar(c);

	if ((c1 = input()) != '/' && c != 0)
	{
		unput(c1);
		goto loop;
	}

	if (c != 0)
		putchar(c1);
}


int column = 0;

void count()
{
	int i;

	for (i = 0; yytext[i] != '\0'; i++)
		if (yytext[i] == '\n')
			column = 0;
		else if (yytext[i] == '\t')
			column += 8 - (column % 8);
		else
			column++;

	ECHO;
}


int check_type()
{

	return(IDENTIFIER);
}