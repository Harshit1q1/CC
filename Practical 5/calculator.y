%{
	#include <stdio.h>
	int flag=0;
%}

%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%

Expression : E{
	printf("\nResult = %d\n",$$);
	return 0;
	}

E : E'+'E   {$$=$1+$3;}
  | E'-'E   {$$=$1-$3;}
  | E'*'E   {$$=$1*$3;}
  | E'/'E   {$$=$1/$3;}
  | E'%'E   {$$=$1%$3;}
  | '-'E    {$$=-$2;}
  | '('E')' {$$=$2;}
  | NUMBER  {$$=$1;}
 ;

%%

void main()
{
	while(1)
	{
		printf("\nEnter Arithmatic Expression : ");
		yyparse();
		if(flag==0)
			printf("Valid Expression!\n");
	}
	
}

void yyerror()
{
	printf("Invalid Expression!\n");
	flag = 1;
}

