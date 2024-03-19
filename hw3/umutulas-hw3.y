%{
#ifdef YYDEBUG
  yydebug = 1;
#endif
#include <stdio.h>
#include "umutulas-hw3.h"
void yyerror (const char *msg) /* Called by yyparse on error */ {return; }

void ValidTime(Node time);
void ValidDate (Node date);

VariableNode ** definedSets;
int VariableI = 0;
int VariableS = 100;

int isError = 0;
char ** errorList;
int errorS = 100;
int errorI = 0;


%}
%token tMAIL tENDMAIL tSCHEDULE tENDSCHEDULE tSEND tTO tFROM tSET tCOMMA tCOLON tLPR tRPR tLBR tRBR tAT   

%union{
    IdentNode identNode;
    Node Node;
    VariableNode VariableNodePtr;
    int lineNum;
}

%token <Node> tSTRING
%token <identNode> tIDENT
%token <Node> tTIME
%token <Node> tDATE
%token <Node> tADDRESS

%start program
%%

program : statements
;

statements : 
            | setStatement statements
            | mailBlock statements
;

mailBlock : tMAIL tFROM tADDRESS tCOLON statementList tENDMAIL
;

statementList : 
                | setStatement statementList
                | sendStatement statementList
                | scheduleStatement statementList
;

sendStatements : sendStatement
                | sendStatement sendStatements 
;

sendStatement : tSEND tLBR option tRBR tTO tLBR recipientList tRBR
;

option: tSTRING | tIDENT
;


recipientList : recipient
            | recipient tCOMMA recipientList
;

recipient : tLPR tADDRESS tRPR
            | tLPR tSTRING tCOMMA tADDRESS tRPR
            | tLPR tIDENT tCOMMA tADDRESS tRPR
;

scheduleStatement : tSCHEDULE tAT tLBR tDATE tCOMMA tTIME tRBR tCOLON sendStatements tENDSCHEDULE
;

setStatement : tSET tIDENT tLPR tSTRING tRPR
;


%%

void validTime(Node time) {
  int hours, minutes;
  const char * timeStr = strdup(time.value);

  char * src = "ERROR at line %d: invalid time format\n";
  char * dest = (char *)malloc(strlen(src) + 50);
  sprintf(src, "ERROR at line %d: invalid time format (%s)\n", time.lineNum, timeStr);
  sscanf(timeStr, "%d:%d", &hours, &minutes);
  
  if (hours < 0 || hours > 23 || minutes >59 || minutes < 0 ){
    errorList[errorI] = strdup(dest);
    errorI += 1;
    isError = 1;
  }

}


void validDate (Node date){
  int day,month, year;
  const char * dt = strdup(date.value);
  char * src =  "ERROR at line %d: date object is not correct\n";
  char * dest = (char *)malloc(strlen(src) + 50);
  sprintf(dest, "ERROR at line %d: date object is not correct (%s)\n", date.lineNum, dt);
  
  
  if (sscanf(dt, "%d/%d/%d", &day, &month, &year) == 3 || sscanf(dt, "%d.%d.%d", &day, &month, &year) == 3 || sscanf(dt, "%d:%d:%d", &day, &month, &year) == 3) {
      
    if (year < 0){

      isError = 1;
      errorList[errorI] = strdup(dest);
      errorI+= 1;
    }else if ((year % 4 != 0 && month == 2 && day > 28) || 
               (month == 4 || month == 6 || month == 9 || month == 11) && day > 30 || 
               (month < 1 || month > 12) || 
               (month == 2 && year % 4 == 0 && day > 29) || 
               (day > 31)) {
      isError = 1;
      errorList[errorI] = strdup(dest);
      errorI++;
    }
  }
}


int main () 
{
   if (yyparse())
   {
      printf("ERROR\n");
      return 1;
    } 
    else 
    {
        printf("OK\n");
        return 0;
    } 
}