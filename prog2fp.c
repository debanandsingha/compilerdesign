#include<stdio.h>
#include<string.h>

int isComment(char*);

int main(int argc, char *argv[]){
  char line[255];
  FILE *fp=fopen(argv[1], "r");

 while(fgets(line, sizeof(line), fp)){
  if(isComment(line)) printf("Comment\n");
  else printf("Not a comment\n");
 }
  fclose(fp);
  return 0;
}

int isComment(char *line){
  if(strncmp(line, "//", 2) == 0) return 1;
  if(strncmp(line, "/*", 2) ==0) return 1;
  return 0;
}
