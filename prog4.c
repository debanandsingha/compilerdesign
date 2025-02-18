// Write a C program to simulate lexical analyzer for validating operators.
#include<stdio.h>
#include<string.h>

int isOperator(char);
void analyzeOP(char *);

int main(){
  char expr[255];

  printf("Enter expression: ");
  fgets(expr, sizeof(expr), stdin); //fgets(store, bufferSize, inputptr)

  analyzeOP(expr);
  return 0;
}

int isOperator(char c){
  const char *op="+-*/=";

  for(int i=0; op[i] != '\0'; i++){
    if(c == op[i]) return 1;
  }

  return 0;
}

void analyzeOP(char *expr){
  for(int i=0; i<strlen(expr); i++){
   if(isOperator(expr[i])) printf("Operator: %c\n",expr[i]);
  }
}
