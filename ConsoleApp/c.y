%{
  #include <stdio.h>

  int yyerror(char * s);
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
 : type id END_OF_INSTRUCTION
 | type id LBRACK INTEGER_LITERAL RBRACK END_OF_INSTRUCTION
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
 : LPAREN RPAREN
 | LPAREN formalsList RPAREN
 ;

formalsList
 : formalDecl
 | formalsList COMMA formalDecl
 ;

formalDecl
 : type id
 ;

block
 : LBRACE declList stmtList RBRACE
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
 : CIN id END_OF_INSTRUCTION
 | CIN id LBRACK exp RBRACK END_OF_INSTRUCTION
 | COUT exp END_OF_INSTRUCTION
 | subscriptExpr ASSIGN exp END_OF_INSTRUCTION
 | id ASSIGN exp END_OF_INSTRUCTION
 | IF LPAREN exp RPAREN block
 | IF LPAREN exp RPAREN block ELSE block
 | WHILE LPAREN exp RPAREN block
 | RETURN exp END_OF_INSTRUCTION
 | RETURN END_OF_INSTRUCTION
 | fnCallStmt END_OF_INSTRUCTION
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
 | SUBSTRACT atom
 | atom
 ;

atom
 : INTEGER_LITERAL
 | STRING_LITERAL
 | TRUE
 | FALSE
 | LPAREN exp RPAREN
 | fnCallExpr
 | subscriptExpr
 | id
 ;

fnCallExpr
 : id LPAREN RPAREN
 | id LPAREN actualList RPAREN
 ;

fnCallStmt
 : id LPAREN RPAREN
 | id LPAREN actualList RPAREN
 ;

actualList
 : exp
 | actualList COMMA exp
 ;

subscriptExpr
 : id LBRACK exp RBRACK
 ;
 
id
 : IDENTIFIER
 ;


%%

int yyerror(char * s) 
{    
	printf ( "%s\n", s); 
	return 0;
}  




