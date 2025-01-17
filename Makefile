CFLAGS = -Wall -Wextra -Wpointer-Integer-compare -Wint-conversion -pedantic -I/usr/local/include -L/usr/local/lib -lX11 -lXft -I/usr/local/include/freetype2 -pthread
CFLAGS += -lrt

PREFIX ?= /usr/local
CC ?= cc

all: herbe

config.h: config.def.h
	cp config.def.h config.h

herbe: herbe.c config.h
	$(CC) herbe.c $(CFLAGS) -o herbe

install: herbe
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f herbe ${DESTDIR}${PREFIX}/bin

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/herbe

clean:
	rm -f herbe

.PHONY: all install uninstall clean
