umutulas-hw2: lex.yy.c umutulas-hw2.tab.c umutulas-hw2.tab.h
	gcc -o umutulas-hw2 lex.yy.c umutulas-hw2.tab.c -lfl

lex.yy.c: umutulas-hw2.flx umutulas-hw2.tab.h
	flex umutulas-hw2.flx

umutulas-hw2.tab.c umutulas-hw2.tab.h: umutulas-hw2.y
	bison -d umutulas-hw2.y

clean:
	rm -f lex.yy.c
	rm -f umutulas-hw2.tab.h
	rm -f umutulas-hw2.tab.c
	rm -f umutulas-hw2

test:
	- /home/yasinalbayrak/cs305golden/hw2/golden-hw2 < /home/yasinalbayrak/cs305golden/tests/test1.ms
	- ./umutulas-hw2 < /home/yasinalbayrak/cs305golden/tests/test1.ms
	- /home/yasinalbayrak/cs305golden/hw2/golden-hw2 < /home/yasinalbayrak/cs305golden/tests/test2.ms
	- ./umutulas-hw2 < /home/yasinalbayrak/cs305golden/tests/test2.ms
	- /home/yasinalbayrak/cs305golden/hw2/golden-hw2 < /home/yasinalbayrak/cs305golden/tests/test3.ms
	- ./umutulas-hw2 < /home/yasinalbayrak/cs305golden/tests/test3.ms
	- /home/yasinalbayrak/cs305golden/hw2/golden-hw2 < /home/yasinalbayrak/cs305golden/tests/test4.ms
	- ./umutulas-hw2 < /home/yasinalbayrak/cs305golden/tests/test4.ms
	- /home/yasinalbayrak/cs305golden/hw2/golden-hw2 < /home/yasinalbayrak/cs305golden/tests/test5.ms
	- ./umutulas-hw2 < /home/yasinalbayrak/cs305golden/tests/test5.ms
	- /home/yasinalbayrak/cs305golden/hw2/golden-hw2 < /home/yasinalbayrak/cs305golden/tests/test6.ms
	- ./umutulas-hw2 < /home/yasinalbayrak/cs305golden/tests/test6.ms
	- /home/yasinalbayrak/cs305golden/hw2/golden-hw2 < /home/yasinalbayrak/cs305golden/tests/test7.ms
	- ./umutulas-hw2 < /home/yasinalbayrak/cs305golden/tests/test7.ms
	- /home/yasinalbayrak/cs305golden/hw2/golden-hw2 < /home/yasinalbayrak/cs305golden/tests/test8.ms
	- ./umutulas-hw2 < /home/yasinalbayrak/cs305golden/tests/test8.ms
	- /home/yasinalbayrak/cs305golden/hw2/golden-hw2 < /home/yasinalbayrak/cs305golden/tests/test9.ms
	- ./umutulas-hw2 < /home/yasinalbayrak/cs305golden/tests/test9.ms
deneme:
	- /home/yasinalbayrak/cs305golden/hw2/golden-hw2 < deneme.txt
	- ./umutulas-hw2 < deneme.txt