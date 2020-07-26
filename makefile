corona: lex.yy.c y.tab.c
	gcc -g lex.yy.c y.tab.c -o corona

lex.yy.c: y.tab.c corona.l
	lex corona.l

y.tab.c: corona.y
	yacc -d corona.y

clean: 
	rm -rf lex.yy.c y.tab.c y.tab.h corona corona.dSYM
