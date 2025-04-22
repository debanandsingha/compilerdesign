%{
	#include<stdio.h>
	#include<stdlib.h>

	int yylex();
	void yyerror(char *e);
%}
%token N ProperNoun DET V ADJ PP Pronoun

%%
S
	: NP VP	{printf("(+) Valid Sentence.\n");}
	;
NP
	: opt_DET opt_ADJ N opt_PP
	| Pronoun
	| ProperNoun
	;

VP
        : V opt_NP
	;

opt_DET
	: DET
	|
	;
opt_ADJ
	: ADJ
	|
	;
opt_PP
	: PP
	|
	;
opt_NP
	: NP
	:
	;
%%

int main(){
	yyparse();
	return 0;
}

void yyerror(char *e){
	fprintf(stderr, "(-) Invalid Sentence\n", e);
}
