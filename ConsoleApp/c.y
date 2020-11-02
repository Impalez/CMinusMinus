%{
  #include <stdio.h>

  int yyerror(char *s);
  extern int yylex(void);
%}

%token END
%token INT
%token BOOL
%token VOID
%token TRUE
%token FALSE
%token IF
%token ELSE
%token WHILE
%token RETURN
%token CIN
%token COUT
%token IDENTIFIER
%token INTEGER_LITERAL
%token STRING_LITERAL
%token CONSTANT
%token NUM
%token LBRACE
%token RBRACE
%token LPAREN
%token RPAREN
%token LBRACK
%token RBRACK
%token COMMA
%token ASSIGN
%token END_OF_INSTRUCTION
%token ADD
%token SUBSTRACT
%token TIMES
%token OVER
%token NOT
%token AND
%token OR
%token EQ
%token NEQ
%token LT
%token GT
%token LTE
%token GTE
%token RIGHT
%token LEFT

%start program
%%

program
 : program varDecl
 | program fnDecl
 | /* empty */
 ;

varDecl
 : type id ';'
 | type id '[' INTEGER_LITERAL ']' ';'
 ;

type
 : INT
 | BOOL
 | VOID
 ;

fnDecl
 : type id parameters block
 ;

parameters
 : '(' ')'
 | '(' formalsList ')'
 ;

formalsList
 : formalDecl
 | formalsList ',' formalDecl
 ;

formalDecl
 : type id
 ;

block
 : '{' declList stmtList '}'
 ;

declList
 : declList varDecl
 | /* empty */
 ;

stmtList
 : stmtList stmt
 | /* empty */
 ;

stmt
 : CIN id ';'
 | CIN id '[' exp ']' ';'
 | COUT exp ';'
 | subscriptExpr '=' exp ';'
 | id '=' exp ';'
 | IF '(' exp ')' block
 | IF '(' exp ')' block ELSE block
 | WHILE '(' exp ')' block
 | RETURN exp ';'
 | RETURN ';'
 | fnCallStmt ';'
 ;

exp
 : exp ADD exp
 | exp SUBSTRACT exp
 | exp TIMES exp
 | exp OVER exp
 | NOT exp
 | exp AND exp
 | exp OR exp
 | exp EQ exp
 | exp NEQ exp
 | exp LT exp
 | exp GT exp
 | exp LTE exp
 | exp GTE exp
 | exp RIGHT exp
 | exp LEFT exp
 | '-' atom
 | atom
 ;

atom
 : INTEGER_LITERAL
 | STRING_LITERAL
 | TRUE
 | FALSE
 | '(' exp ')'
 | fnCallExpr
 | subscriptExpr
 | id
 ;

fnCallExpr
 : id '(' ')'
 | id '(' actualList ')'
 ;

fnCallStmt
 : id '(' ')'
 | id '(' actualList ')'
 ;

actualList
 : exp
 | actualList ',' exp
 ;

subscriptExpr
 : id '[' exp ']'
 ;
 
id
 : IDENTIFIER
 ;


%%

void yerror(char * s)
/* yacc error handler */
{
  printf("%s\n", s);
}





