%{
	#include "calc.tab.h"
%}

%%
[0-9]+(\.[0-9]+)?	{ yylval = atof(yytext); return NUM; }
[ \t\r]+		{}
"+"			{return '+';}
"-"                     {return '-';}
"*"                     {return '*';}
"/"                     {return '/';}
"("			{return '(';}
")"			{return ')';}
\n			{return '\n';}
.			{printf("unknown\n");}
%%

int yywrap(){
	return 1;
}
