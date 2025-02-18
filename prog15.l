%{
  #include<stdio.h>
  FILE *out;
%}

%%
"float"	{printf("double"); fprintf(out, "double");}
\n	{printf("%s", yytext); fprintf(out, yytext);}
.	{printf("%s", yytext); fprintf(out, yytext);}
%%

int main(int argc, char *argv[]){
  yyin = fopen(argv[1], "r");
  out = fopen("new1.c", "w");
  yylex();

  fclose(yyin);
  fclose(out);
  return 0;
}
