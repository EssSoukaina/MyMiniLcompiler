
%{
#include <stdio.h>
#include "tokens.h"
%}

%%

"Import"        { return IMPORT; }
"CONST"         { return CONST_KEYWORD; }
"FOR"           { return FOR_LOOP; }
"In"            { return INPUT; }
"Out"           { return OUTPUT; }

[a-zA-Z][a-zA-Z0-9]*    { return IDENTIFIER; }

[0-9]+                  { return INTEGER_CONSTANT; }
[0-9]+\.[0-9]+          { return REAL_CONSTANT; }
\"[^"]*\"               { return STRING_CONSTANT; }

"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MULTIPLY; }
"/"             { return DIVIDE; }
"="             { return EQUALS; }
"!="            { return NOT_EQUALS; }
"<"             { return LESS_THAN; }
"<="            { return LESS_THAN_OR_EQUAL; }
">"             { return GREATER_THAN; }
">="            { return GREATER_THAN_OR_EQUAL; }
"&"             { return LOGICAL_AND; }
"|"             { return LOGICAL_OR; }
"!"             { return LOGICAL_NOT; }

"("             { return LEFT_PAREN; }
")"             { return RIGHT_PAREN; }
"{"             { return LEFT_BRACE; }
"}"             { return RIGHT_BRACE; }
";"             { return SEMICOLON; }
","             { return COMMA; }

"//".*          ; 
"/*"[^*]*"*"+([^/*][^*]*"*"+)*"/"    ; 

[ \t\n\r]       ; 

.               { fprintf(stderr, "Unexpected character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}   







