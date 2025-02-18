%{
  #include<stdio.h>
  FILE *out;
  int count=0;
%}

%%
^"//".*		{count++;}
^"/*".*"*/"	{count++;}
\n		{fprintf(out, yytext);}
.		{fprintf(out, yytext);}
%%

int main(int argc, char *argv[]){
  yyin = fopen(argv[1], "r");
  out = fopen("new.c", "w");
  yylex();
  printf("Number of comments: %d\n", count);
  return 0;
}
