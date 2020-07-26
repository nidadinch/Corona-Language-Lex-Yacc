# CSE 334 - Corona Language Yacc Project
Lex and Yacc for our "Corona" Language that an infectious pandemic disease. This project done for Programming Languages lesson homework at Akdeniz University Computer Science Engineering program. 

There is only lex, yacc and other files, and descriptions. We will develop.

"Corona Language" inspired heavily by Java. But this language designed as Turkish language. And syntax in CAPSLOCK form mostly. 

##### Let's have a look our language:

Corona Language;
```sh
EGER (SAYI yas KUCUKESIT 65) ISE
   EKRANAYAZ ("Stay Home") NOKTA
YADA (kronikhastalik ESIT DOGRU)
   EKRANAYAZ ("Stay Home too")


In Java;
```sh
If (int yas <= 65){
   println("Stay Home");
}else {
   println("Stay Home too");
}


```

As you can see, if we compare both of them, "If" equals "EGER", "{" equals ISE and "}" equals NOKTA in this language. 
If you want to improve my code, please comment. Your feedbacks are important. Thank you, Nida DINC

## BNF Form (Updated)
```sh

<language> ::= language <statement> language
<type> ::= <numericType> | <string> | DEGISKEN

<numericType> ::= SAYI 
<string> ::= YAZIDIZISI

<statement> ::= <ifElseStatement> | <whileStatement> |<printStatement> | <scanStatement> | <functionStatement> | <commentStatement> | <assignmentStatement> | <boolStatement> 


<ifElseStatement> ::= EGER ( <boolExpression> ) ISE <exp> NOKTA YOKSA <exp> 

<whileStatement> ::= DONGU ( <expression> ) <statement> 
<printStatement> ::= EKRANAYAZ ( <type> )
<scanStatement> ::= TARA ( " <type> " )
<functionStatement> ::= CALISTIR <string> ( <type> DEGISKEN ) [ <exp> ]
<commentStatement> ::= YORUM_AC <type> YORUM_KAPA | YORUM 
<assignmentStatement> ::= DEGISKEN '=' exp
<boolStatement> ::= SAYI ESITTIR SAYI | SAYI KUCUKTUR SAYI | SAYI BUYUKTUR SAYI | SAYI KUCUKESIT SAYI | SAYI BUYUKESIT SAYI | SAYI VE SAYI | SAYI YADA SAYI 

<expression> ::= <comparisonExpression> | <orExpression> | <andExpression> | <boolExpression>
<exp> ::= <type> | <exp> ARTI <type> | <exp> EKSI <type>
<boolExpression> ::= <type> ESITTIR <type> | <type> BUYUKTUR <type> | <type> KUCUKTUR <type> | <type> BUYUKESIT <type> | <type> KUCUKESIT <type> | <type> VE <type> | <type> YADA <type> 
<comparisonExpression> ::= <numericType> <logicalOperator> <numericType> | DEGISKEN <logicalOperator> <numaricType> | DEGISKEN <logicalOperator> DEGISKEN 
<orExpression> ::= DOGRULUK YADA DOGRULUK
<andExpression> ::= DOGRULUK VE DOGRULUK
<logicalOperator>::= ESITTIR | KUCUKTUR | BUYUKTUR | BUYUKESIT | KUCUKESIT 
<assignmentOperator> ::= ARTI | EKSI | BOLU | CARPI | KALAN 



```

#### Running instructions:
```sh
make
./corona < example.cl
...(some output)...
make clean
```
