%{
 #include<stdio.h>
 int count=0;
%}

%%
"<"[^>]+">"	{printf("[ %s ] ", yytext); count++;}	//captures one or more characters that are not >
.		{}
%%

int main(int argc, char* argv[]){
  yyin = fopen(argv[1], "r");
  yylex();
  fclose(yyin);

  printf("\nTotal number of tags: %d\n", count);
  return 0;
}
