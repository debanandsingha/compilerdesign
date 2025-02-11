%{
    #include<stdio.h>
    int line_count = 0;
%}

%%
\n    { line_count++; }
.     {}
%%
int main(int argc, char* argv[]){
    yyin = fopen(argv[1], "r");
    yylex();
    printf("Number of lines: %d\n", line_count);
    return 0;
}
