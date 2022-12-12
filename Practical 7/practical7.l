%{
    #include "y.tab.h";
%}

alpha [A-Za-z]
digit [0-9]

%%

"for" return FOR;
"if" return IF;
"else" return ELSE;
[0-9]+ return NUM;
{alpha}({alpha}|{digit})* return ID;
"<=" return LE;
">=" return GE;
"==" return EQ;
"!=" return NE;
"||" return OR;
"&&" return AND;
. return yytext[0];

%%

int yywrap()
{
    return 1;
}