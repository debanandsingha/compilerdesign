%{
  #include<stdio.h>
  int line=0;
  int wrd=0;
  int chr=0;
%}

%%
\n		{line++;chr++;}
.		{chr++;}
[a-zA-Z0-9]+	{wrd++; /*printf("<%s> ", yytext);*/}
%%

int main(int argc, char *argv[]){
  yyin = fopen(argv[1], "r");
  yylex();
  fclose(yyin);

  printf("Number of lines: %d\n", line);
  printf("Number of characters: %d\n", chr);
  printf("Number of words: %d\n", wrd);

  return 0;
}
