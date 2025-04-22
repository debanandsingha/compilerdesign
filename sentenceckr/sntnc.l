%{
	#include "sntnc.tab.h"
%}

%%
"name"	{return N;}
"Aam"|"Sham"	{return ProperNoun;}
([Mm]y)	{return DET;}
"is"	{return V;}
.	{}
\.\n	{return 0;}
%%

int yywrap(){return 1;}
