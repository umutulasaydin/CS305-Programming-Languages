%{
#include <stdio.h>
void yyerror (const char *s) /* Called by yyparse on error */
{
return;
}
%}
%token tMAIL tENDMAIL tSCHEDULE tENDSCHEDULE tSEND tSET tTO tFROM tAT tCOMMA tCOLON tLPR tRPR tLBR tRBR tIDENT tSTRING tDATE tTIME tADDRESS
%%
main: | body_object main
;
body_object: mail_object | set_object
;
mail_object: tMAIL tFROM tADDRESS tCOLON content_list tENDMAIL
;
set_object: tSET tIDENT tLPR tSTRING tRPR
;
content_list: | content content_list
;
content: schedule_object | send_object | set_object
;
schedule_object: tSCHEDULE tAT time_object  tCOLON send_list_object tENDSCHEDULE
;
send_object: tSEND tLBR tIDENT tRBR tTO receipent_list_object
| tSEND tLBR tSTRING tRBR tTO receipent_list_object
;
send_list_object: send_object
| send_object send_object
;
receipent_list_object: tLBR receipent_list tRBR
;
receipent_list: receipent_object
| receipent_object tCOMMA receipent_list
;
receipent_object: tLPR receipent_info tRPR
;
receipent_info : tADDRESS 
| tIDENT tCOMMA tADDRESS 
| tSTRING tCOMMA tADDRESS
;
time_object: tLBR tDATE tCOMMA tTIME tRBR
;
%% 

int main () {
   if (yyparse())
   {
      // parse error
      printf("ERROR\n");
      return 1;
} else {
      // successful parsing
      printf("OK\n");
      return 0;
    }
}
