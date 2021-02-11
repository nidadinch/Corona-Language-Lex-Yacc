#  Corona Language - LEXIAL ANALYSIS & YACC

## About The Project
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


As you can see, if we compare both of them, "If" equals "EGER", "{" equls "[" and "}" equals "]" in our language. We added scan as "tara", for classes; "BOLUM" and for functions; we added "CALISTIR" . 



## Built With 

* C

## Getting Started 

* Makefile:

1. lex:
   ```sh
   lex corona.l
   gcc -o corona lex.yy.c -ll
   ```

2. clean:
   ```sh
   rm corona
   rm lex.yy.c
   ```

* Other:

1. 
   ```sh
   make
   ./corona < example.cl
   ...(some output)...
   make clean
   ```
   
## BNF Form 
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
   
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



## License

Distributed under the MIT License. See `LICENSE` for more information.


## Contact

Nida Dinç - niddinc@gmail.com

Project Link: [https://github.com/nidadinch/Corona-Language-Lex-Yacc](https://github.com/nidadinch/Corona-Language-Lex-Yacc)
