
CFLAGS += -Wall -Wextra -std=c11 -pedantic-errors
LDFLAGS += -lm -lncurses -lSDL2 -g -O0

sokoban: main.o grid.o player.o sdl2.o
	gcc $^ -o $@ $(LDFLAGS)

main : main.c
	gcc $(CFLAGS) -c $< -o $@

grid.o : grid.c grid.h
	gcc $(CFLAGS) -c $< -o $@

player.o : player.c player.h
	gcc $(CFLAGS) -c $< -o $@
sdl2.o : sdl2.c sdl2.h
	gcc $(CFLAGS) -c $< -o $@
clean :
	rm -rf *.o

docs :
	doxygen Doxyfile

install_dir:
	cd SDL2 && ./configure --prefix=$$PWD/../install_dir
	cd SDL2 && make install -j6
archive :
	tar -zcvf HASANLI_AYHAN.tar.gz README.md Makefile main.c grid.h grid.c player.h player.c sdl2.c sdl2.h level1.txt Doxyfile