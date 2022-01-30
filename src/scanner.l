%{
#include "y.tab.h"
%}

%option caseless
%option noyywrap

VAR					[a-z][a-z0-9_]*

CONJ				"&"|"*"|"and"|"dan"

DISJ				"|"|"+"|"or"|"atau"

NEG					"~"|"!"|"not"|"bukan"

EQUV				"="|"<->"

IMP					"->"|">"
IF					"if"|"jika"
THEN				"then"|"maka"

TRUE				"true"|"benar"|"1"
FALSE				"false"|"salah"|"0"

INVALID_TRUTH		"1"[a-z]+|"0"[a-z]+

OGROUP				"("|"{"|"["
CGROUP				")"|"}"|"]"

DIGIT				[0-9]+
WHITESPACE			[ \t]
EOL                 \n
IGNORE_TOKEN		.

%%

{CONJ}				{ return CONJ; }

{DISJ}				{ return DISJ; }

{NEG}				{ return NEG; }

{EQUV}				{ return EQUV; }

{IMP}				{ return IMP; }

{IF}				{ return IF; }

{THEN}				{ return THEN; }

{OGROUP}			{ return '('; }

{CGROUP}			{ return ')'; }

{INVALID_TRUTH}		/* Ignore */

{TRUE}				{ yylval = 1; return CONST; }

{FALSE}				{ yylval = 0; return CONST; }

{VAR}				{ return VAR; }

{DIGIT}				/* Ignore */
{WHITESPACE}		/* Ignore */
{EOL}               { return EOL; }
{IGNORE_TOKEN}		/* Ignore */

%%