all:
	flex lexer.lex
	gcc lex.yy.c -L/usr/lib -ll -o compiler

