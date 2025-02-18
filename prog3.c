//Write a C program to test whether a given identifier is valid or not
/*
  1. must start with underscore or letter
  2. any char letter/number/underscores
  3. no keywords/special characters/whitespaces
     ctype.h: isalpha(), isdigit(), isalnum()
*/

#include<stdio.h>
#include<string.h> //strlen, strcmp
#include<ctype.h>

int isId(char*);

int main(){
  char id[100];

  printf("Enter string: ");
//  fgets(id, sizeof(id), stdin); // read int var=7;
  scanf("%s",id);  //read var

  if(isId(id)) printf("Valid Identifier\n");
  else printf("Invalid Identifier\n");


  return 0;
}

int isId(char *id){
  // check 1st character
  if(!(isalpha(id[0]) || id[0] == '_')) return 0;
  // check remaining character
  for(int i=1; i<strlen(id); i++){
    if(!(isalnum(id[i]) || id[i] == '_')) return 0;
  }


  // check if id is keyword
  const char *keywords[]={"int", "main", "void"};
  for(int i=0; i< sizeof(keywords)/sizeof(keywords[0]); i++){
    if(strcmp(id, keywords[i]) == 0) return 0;
  }

  return 1;
}

