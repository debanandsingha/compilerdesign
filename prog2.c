//Write a C program to identify whether a given line is a comment or not
#include<stdio.h>
#include<string.h>

int isComment(char *);

int main(){
  char line[256];

  printf("Enter a line of code: ");
  fgets(line, sizeof(line), stdin);

  if(isComment(line)) printf("This is a comment\n");
  else printf("this is not a comment\n");
  return 1;
}

int isComment(char *line){
  if(strncmp(line, "//", 2) == 0) return 1;
  if(strncmp(line, "/*", 2) == 0) return 1;

  return 0;
}
