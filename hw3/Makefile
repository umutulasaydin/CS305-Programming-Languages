umutulas-hw3: lex.yy.c umutulas-hw3.tab.c umutulas-hw3.tab.h
	gcc -o umutulas-hw3 lex.yy.c umutulas-hw3.tab.c -lfl

lex.yy.c: umutulas-hw3.flx umutulas-hw3.tab.h
	flex umutulas-hw3.flx

umutulas-hw3.tab.c umutulas-hw3.tab.h: umutulas-hw3.y
	bison -d umutulas-hw3.y

clean:
	rm -f lex.yy.c
	rm -f umutulas-hw3.tab.h
	rm -f umutulas-hw3.tab.c
	rm -f umutulas-hw3

test:
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test1.ms > output1-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test1.ms > output1
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test2.ms > output2-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test2.ms > output2
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test3.ms > output3-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test3.ms > output3
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test4.ms > output4-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test4.ms > output4
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test5.ms > output5-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test5.ms > output5
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test6.ms > output6-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test6.ms > output6
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test7.ms > output7-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test7.ms > output7
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test8.ms > output8-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test8.ms > output8
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test9.ms > output9-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test9.ms > output9
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test10.ms > output10-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test10.ms > output10
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test11.ms > output11-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test11.ms > output11
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test12.ms > output12-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test12.ms > output12
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test13.ms > output13-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test13.ms > output13
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test14.ms > output14-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test14.ms > output14
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test15.ms > output15-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test15.ms > output15
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test16.ms > output16-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test16.ms > output16
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test17.ms > output17-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test17.ms > output17
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test18.ms > output18-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test18.ms > output18
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test19.ms > output19-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test19.ms > output19
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < /home/yasinalbayrak/cs305golden/tests/test20.ms > output20-golden
	- ./umutulas-hw3 < /home/yasinalbayrak/cs305golden/tests/test20.ms > output20
	- diff output1 output1-golden
	- diff output2 output2-golden
	- diff output3 output3-golden
	- diff output4 output4-golden
	- diff output5 output5-golden
	- diff output6 output6-golden
	- diff output7 output7-golden
	- diff output8 output8-golden
	- diff output9 output9-golden
	- diff output10 output10-golden
	- diff output11 output11-golden
	- diff output12 output12-golden
	- diff output13 output13-golden
	- diff output14 output14-golden
	- diff output15 output15-golden
	- diff output16 output16-golden
	- diff output17 output17-golden
	- diff output18 output18-golden
	- diff output19 output19-golden
	- diff output20 output20-golden
deneme:
	- /home/yasinalbayrak/cs305golden/hw3/golden-hw3 < deneme.txt
	- ./umutulas-hw3 < deneme.txt