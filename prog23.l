%{
    #include<stdio.h>
%}

%%
[01]{8}$	{printf("Valid 8-bit binary number: %s\n", yytext);}
[01]{1,7}$	{printf("Error: Binary number less than 8 bits: %s\n", yytext);}
[01]{8}[01]*	{printf("Error: Binary number is more than 8 bits: %s\n", yytext);}
[0-9]*		{printf("Error: Invalid binary digit: %s\n", yytext);}
%%

int main(){
    yylex();
    return 0;
}
