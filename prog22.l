%{
    #include<stdio.h>
    int sglline=0;
    int mulline=0;
    FILE *outfile;
%}

%%
"//".*		{sglline++;}
"/*".*"*/"	{mulline++;}
\n		{fprintf(outfile, "\n");}
.		{fprintf(outfile, "%s", yytext);}
%%

int main(int argc, char* argv[]){
    yyin=fopen(argv[1], "r");

    outfile=fopen("newfile.c", "w");
	
    yylex();
    fclose(yyin);
    fclose(outfile);

    printf("No of single line comments: %d\n", sglline);
    printf("No of multi line comments: %d\n", mulline);
    printf("New file created: newfile.c\n");
    return 0;
}
