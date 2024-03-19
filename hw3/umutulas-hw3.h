#ifndef __MS_H
#define __MS_H

typedef struct Node
{
   char *value;
   int lineNum;
} Node;

typedef struct IdentNode
{
   char *value;
   int lineNum;
} IdentNode;


typedef struct VariableNode
{
   char *valueIdent;
   char *valueString;
   int lineNum;
} VariableNode;



#endif