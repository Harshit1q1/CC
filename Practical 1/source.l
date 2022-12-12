%{
	#include <stdio.h>	
	int tokens = 0;
	int lines = 1;
%}

letter [a-zA-Z_]
digit [0-9]
int_literal -{digit}+|{digit}+
str_literal \"[^\n].*\"
keywords "for"|"NULL"|"struct"|"switch"|"continue"|"do"|"if"|"else"|"return"|"break"|"case"|"default"|"const"
keywords2 "auto"|"enum"|"extern"|"goto"|"register"|"short"|"signed"|"sizeof"|"static"|"switch"|"typedef"
keywords3 "union"|"unsigned"|"volatile"|"while"|"main"
datatype "int"|"float"|"char"|"double"|"void"|"long"
conditional_operator ">="|"<="|"=="|">"|"<"|"!="
logical_operator "||"|"&&"|"!"
bitwise_operator "|"|"<<"|"~"|">>"|"^"
unary_operator "++"|"--"
arithmatic_operator "*"|"+"|"/"|"-"
assignment_operator "="|"*="|"+="|"/="|"-="
identifier {letter}({letter}|{digit})*
iofunction 'printf'|'scanf'

%%

\n {lines++; printf("\nLine %d\n",lines);}
[ \t] {}
[()#{}|;:&,\[\]] {tokens++; printf("SPECIAL_SYMBOL\t\t:\t%s\n",yytext);}
{keywords}|{keywords2}|{keywords3} {tokens++; printf("KEYWORD\t\t:\t%s\n",yytext);}
{arithmatic_operator} {tokens++; printf("ARITHMATIC_OPERATOR\t:\t%s\n",yytext);}
{assignment_operator} {tokens++; printf("ASSIGNMENT_OPERATOR\t:\t%s\n",yytext);}
{conditional_operator} {tokens++; printf("CONDITIONAL_OPERATOR\t:\t%s\n",yytext);}
{unary_operator} {tokens++; printf("UNARY_OPERATOR\t:\t%s\n",yytext);}
{datatype} {tokens++; printf("DATA_TYPE\t\t:\t%s\n",yytext);}
{identifier} {tokens++; printf("IDENTIFIER\t\t:\t%s\n",yytext);}
{int_literal} {tokens++; printf("INT_LITERAL\t\t:\t%s\n",yytext);}
{int_literal}"."{int_literal} {tokens++; printf("FLOAT_LITERAL\t\t:\t%s\n",yytext);}
{str_literal} {tokens++;printf("STR_CONSTANT\t\t:\t%s\n",yytext);}
{iofunction} {tokens++; printf("IO_FUNCTION\t\t:\t%s\n",yytext);}
\/\/[^\n].* {printf("COMMENT\t\t:\t%s\n",yytext);} //single line comment
\/\*[^(*/)]*\*\/ {printf("COMMENT\t\t:\t%s\n",yytext);} //multi line comment

%%

int yywrap(){}

int main(){
printf("Line 1\n");
yylex();
printf("\n\nTotal tokens = %d",tokens);
return 0;
}
