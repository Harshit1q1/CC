%{
    #include <stdio.h>
    #include <stdlib.h>
    int flag = 0;
%}

%token ID NUM FOR LE GE EQ NE OR AND IF ELSE
%right '='
%left OR AND
%left '<' '>' LE GE EQ NE
%left '+' '-'
%left '*' '/'
%right UMINUS
%left '!'

%%

SS : SS S
   | S {
        printf("\nInput accepted!\n\n");
        exit(0);
    }
    ;

S : E';'S
  | IFST S
  | FORST S
  | FORST
  | IFST
  | E
  |
  ;

IFST : IF'('E')'S
     | IF'('E')'S ELSE S
     ;

FORST : FOR'('E';'E2';'E')'DEF
    ;

DEF : '{'E';''}'
    | '{'S'}'
    |
    ;

E : E'='E
  | E'+'E
  | E'-'E
  | E'*'E
  | E'/'E
  | E'<'E
  | E'>'E
  | E LE E
  | E GE E
  | E EQ E
  | E NE E
  | E OR E
  | E AND E
  | T
  |
  ;

E2 : E'<'E
   | E'>'E
   | E LE E
   | E GE E
   | E EQ E
   | E NE E
   | E OR E
   | E AND E
   |
   ;

T : ID
  | NUM
  ;

%%

void main()
{
    printf("Enter code having loop controls and control statements (if, else, >=, for, etc.) : ");
    yyparse();
}

void yyerror()
{
    printf("\nSyntax Error!\n\n");
    flag = 1;
}