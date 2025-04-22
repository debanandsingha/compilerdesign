%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex();
	void yyerror(const char *e);
%}
%define api.value.type {double}
%token NUM

%right UMINUS
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
input
	:
	| input line
	;

line
	: expr '\n'	{printf("Result: %f\n", $1);}
	;

expr
	: expr '+' expr	{$$ = $1 + $3;}
	| expr '-' expr {$$ = $1 - $3;}
	| expr '*' expr {$$ = $1 * $3;}
	| expr '/' expr {
		if($3 == 0){
			printf("Error: Division by 0\n");
			$$ = 0;
		}else{
			$$ = $1/$3;
		}
	}
	| '-' expr %prec UMINUS	{ $$ = -$2 ;}
	| '(' expr ')'	{$$ = $2;}
	| NUM		{$$ = $1;}
	;
%%

int main(){
	yyparse();
	return 0;
}

void yyerror(const char *e){
	fprintf(stderr, "Error: %s\n", e);
}
