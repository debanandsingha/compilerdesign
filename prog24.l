%{
#include<stdio.h>
%}

%%

"int"|"main"|"return"	{printf("Keyword: %s\n", yytext);}
[a-zA-Z_][a-zA-Z0-9_]*	{printf("Identifier: %s\n", yytext);}
[0-9]+			{printf("Integer literal: %s\n", yytext);}
"("|")"			{printf("Character: Paranthesis %s\n", yytext);}
"{"|"}"			{printf("Character: Curly Bracket %s\n", yytext);}
";"|","			{printf("Character: %s\n", yytext);}
"="			{printf("Operator: %s\n", yytext);}
\/\/.*			{printf("Comment: %s\n", yytext);}
[ \t\n]			{/* ignore whitespace */}
.			{printf("Invalid character: %s\n", yytext);}

%%

int main(int argc, char* argv[]){
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}
