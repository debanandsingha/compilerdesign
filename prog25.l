%{
#include<stdio.h>
char tokens[100][100];
int count=0;
%}

%%

"int"|"main"|"return"|"printf"   {sprintf(tokens[count++],"%s", yytext);}
[a-zA-Z_][a-zA-Z0-9_]*  {sprintf(tokens[count++],"%s", yytext);}
[0-9]+                  {sprintf(tokens[count++],"%s", yytext);}
"("|")"                 {sprintf(tokens[count++],"%s", yytext);}
"{"|"}"                 {sprintf(tokens[count++],"%s", yytext);}
";"|","|":"|"\""         {sprintf(tokens[count++],"%s", yytext);}
"="|"+"                 {sprintf(tokens[count++],"%s", yytext);}
"%d"                    {sprintf(tokens[count++],"%s", yytext);}
\/\/.*                  {sprintf(tokens[count++],"%s", yytext);}
[ \t\n]                 {/* ignore whitespace */}
.                       {sprintf(tokens[count++],"%s", yytext);}

%%

int main(int argc, char* argv[]){
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);

    printf("Number of Tokens: %d\n\n", count);

    printf("Tokens: ");
    for (int i = 0; i < count; i++) {
        printf(" <%s> ", tokens[i]);
    }

    return 0;
}
