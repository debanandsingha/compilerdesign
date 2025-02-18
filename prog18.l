%{
 #include<stdio.h>
%}

%%
[aeiouAEIOU][a-zA-Z]+	{printf("%say\n", yytext);}
[^aeiouAEIOU|^\n][a-zA-Z]+	{printf("%s%cay\n", yytext+1, yytext[0]);}
%%

int main(){
  yylex();
  return 0;
}
