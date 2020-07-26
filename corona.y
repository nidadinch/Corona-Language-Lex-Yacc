
%{
 void yyerror(char *s);
 int yylex();
 #include <stdio.h>
 #include <stdlib.h>
#include <ctype.h>
 int symbols[52];
 int symbolVal(char symbol);
 void updateSymbolVal(char symbol, int val);
 int i = 0;
%}

%union {int num; char id; char *st}
%start language

%token DOGRULUK ISE NOKTA EGER YADA YOKSA YORUM YORUM_AC YORUM_KAPA ESITTIR VEYA  VE KUCUKESIT KUCUKTUR BUYUKESIT BUYUKTUR EKRANAYAZ TARA DONGU ARTI EKSI BOLU CARPI KALAN CALISTIR

%token <num> SAYI
%token <id> DEGISKEN
%token <st> YAZIDIZISI

%type <id> assignmentStatement
%type <num> exp term boolExpression
%type <num> boolStatement
%type <num> whileStatement



%%

language :
         | language statement language
         | expression
         | error  /* error */
         ;

statement:
          ifElseStatement
         | whileStatement
         | printStatement
         | scanStatement
         | functionStatement
         | commentStatement
         | assignmentStatement
         | boolStatement
         ;

expression:
          comparisonExpression
         | orExpression
         | andExpression
         | boolExpression
         ;


ifElseStatement: 
                EGER '(' boolExpression ')' ISE exp NOKTA YOKSA exp          { if($3==1){
                                                                    			 printf("%d\n", $6);
                                                                       		  }else {
                                                                       			 printf("%d\n", $9);} 
                                                                             }
                ;

whileStatement: 
                  DONGU '(' term KUCUKTUR term ')' exp        
{printf("%d\n" , $$ = ($5-$3)*$7);}
                | DONGU '(' term BUYUKTUR term ')' exp        
{printf("%d\n" , $$ = ($3-$5)*$7);}
                ;

printStatement: 
                EKRANAYAZ '(' term ')'   {printf("Printing %d\n", $3);}
                ;

scanStatement:
                TARA
                ;

functionStatement:
                 CALISTIR string '(' term DEGISKEN ')' [ exp ]
                ;

commentStatement:
                  YORUM_AC term YORUM_KAPA
                | YORUM
                ;

assignmentStatement: 
                DEGISKEN '=' exp          { updateSymbolVal($1,$3); }
                ;

boolStatement:
                SAYI ESITTIR SAYI           { $$ = $1 == $3 ;
                                              if($$==1){
                                               printf("TRUE\n");
                                               }else{
                                               printf("FALSE\n");}
                                            }

              | SAYI KUCUKTUR SAYI          { $$ = $1 < $3 ;
                                              if($$==1){
                                               printf("TRUE\n");
                                               }else{
                                               printf("FALSE\n");}
                                            }

              | SAYI BUYUKTUR SAYI          { $$ = $1 > $3 ;
                                              if($$==1){
                                               printf("TRUE\n");
                                               }else{
                                               printf("FALSE\n");}
                                            }

              | SAYI KUCUKESIT SAYI         { $$ = $1 <= $3 ;
                                              if($$==1){
                                               printf("TRUE\n");
                                               }else{
                                               printf("FALSE\n");}
                                            }

              | SAYI BUYUKESIT SAYI         { $$ = $1 >= $3 ;
                                              if($$==1){
                                               printf("TRUE\n");
                                               }else{
                                               printf("FALSE\n");}
                                            }

              | SAYI VE SAYI                { $$ = $1 && $3 ;
                                              if($$==1){
                                               printf("TRUE\n");
                                               }else{
                                               printf("FALSE\n");}
                                            }

              | SAYI YADA SAYI              { $$ = $1 || $3 ;
                                              if($$==1){
                                               printf("TRUE\n");
                                               }else{
                                               printf("FALSE\n");}
                                            }
              ;

comparisonExpression:
              SAYI logicalOperator SAYI
            | DEGISKEN logicalOperator SAYI
            | DEGISKEN logicalOperator DEGISKEN
            ;

orExpression:
            DOGRULUK YADA DOGRULUK
            ;

andExpression:
            DOGRULUK VE DOGRULUK
            ;

boolExpression:
              term ESITTIR term                    { $$ = $1 == $3;}
            | term BUYUKTUR term                   { $$ = $1 > $3;}
            | term KUCUKTUR term                   { $$ = $1 < $3;}
            | term BUYUKESIT term                  { $$ = $1 >= $3;}
            | term KUCUKESIT term                  { $$ = $1 <= $3;}
            | term VE term                         { $$ = $1 && $3;}
            | term YADA term                       { $$ = $1 || $3;}
            ;


logicalOperator:
              ESITTIR
            | KUCUKTUR
            | BUYUKTUR
            | BUYUKESIT
            | KUCUKESIT
            ;



string      : YAZIDIZISI
            ;

exp :
            term                        {$$ = $1;}
            | exp ARTI term             {$$ = $1 + $3;}
            | exp EKSI term             {$$ = $1 - $3;}
            ;

term :
              SAYI              
            | DEGISKEN                 {$$ = symbolVal($1);}
            ;



%%
/* C Code*/

int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
}

int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}

int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

	return yyparse ( );
}

void yyerror(char *s) {
 fprintf(stderr, "%s\n", s);
 
}
