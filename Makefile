run: build
	kimup -g 0 0 talker.o 768 words.o 6016 9600.o

test: run
	minicom -b 9600 -w

build: talker.o 9600.o words.o

clean:
	rm -f *.o

%.o: %.xa
	xa -o $@ $<

.PHONY: run test build
