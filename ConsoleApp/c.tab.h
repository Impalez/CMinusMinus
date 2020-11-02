/* A Bison parser, made by GNU Bison 3.7.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_C_TAB_H_INCLUDED
# define YY_YY_C_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    END = 258,                     /* END  */
    INT = 259,                     /* INT  */
    BOOL = 260,                    /* BOOL  */
    VOID = 261,                    /* VOID  */
    TRUE = 262,                    /* TRUE  */
    FALSE = 263,                   /* FALSE  */
    IF = 264,                      /* IF  */
    ELSE = 265,                    /* ELSE  */
    WHILE = 266,                   /* WHILE  */
    RETURN = 267,                  /* RETURN  */
    CIN = 268,                     /* CIN  */
    COUT = 269,                    /* COUT  */
    IDENTIFIER = 270,              /* IDENTIFIER  */
    INTEGER_LITERAL = 271,         /* INTEGER_LITERAL  */
    STRING_LITERAL = 272,          /* STRING_LITERAL  */
    CONSTANT = 273,                /* CONSTANT  */
    NUM = 274,                     /* NUM  */
    LBRACE = 275,                  /* LBRACE  */
    RBRACE = 276,                  /* RBRACE  */
    LPAREN = 277,                  /* LPAREN  */
    RPAREN = 278,                  /* RPAREN  */
    LBRACK = 279,                  /* LBRACK  */
    RBRACK = 280,                  /* RBRACK  */
    COMMA = 281,                   /* COMMA  */
    ASSIGN = 282,                  /* ASSIGN  */
    END_OF_INSTRUCTION = 283,      /* END_OF_INSTRUCTION  */
    ADD = 284,                     /* ADD  */
    SUBSTRACT = 285,               /* SUBSTRACT  */
    TIMES = 286,                   /* TIMES  */
    OVER = 287,                    /* OVER  */
    NOT = 288,                     /* NOT  */
    AND = 289,                     /* AND  */
    OR = 290,                      /* OR  */
    EQ = 291,                      /* EQ  */
    NEQ = 292,                     /* NEQ  */
    LT = 293,                      /* LT  */
    GT = 294,                      /* GT  */
    LTE = 295,                     /* LTE  */
    GTE = 296,                     /* GTE  */
    RIGHT = 297,                   /* RIGHT  */
    LEFT = 298                     /* LEFT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_C_TAB_H_INCLUDED  */
