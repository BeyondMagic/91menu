# See LICENCE file for copyright and licence details

VERSION = 1.1
CC = cc
PROGNAME = 91menu-o
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man
# OpenBSD uncomment
#MANPREFIX = ${PREFIX}/man

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib
FREETYPEINC = /usr/include/freetype2
# OpenBSD uncomment
#FREETYPEINC = ${X11INC}/freetype2
FREETYPELIB = -lfontconfig -lXft

INCS = -I${X11INC} -I${FREETYPEINC}
LIBS = -L${X11LIB} -lX11 ${FREETYPELIB} #$(XINERAMALIBS)

CPPFLAGS = -DVERSION=\"${VERSION}\" -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=2000809L
CFLAGS = -std=c99 -pedantic -Wall -Os ${CPPFLAGS} ${INCS}
LDFLAGS = ${LIBS}

all: clean options 91menu-o clean_object

options:
	@echo 91menu-o build options:
	@echo "LDFLAGS = ${LDFLAGS}"
	@echo "CFLAGS  = ${CFLAGS}"
	@echo "CC      = ${CC}"

config.h:
	cp config.def.h $@

.c.o :
	${CC} -c ${CFLAGS} $<

91menu-o: 91menu.o drw.o utf8.o util.o
	${CC} -o $@ 91menu.o drw.o utf8.o util.o ${LDFLAGS}

clean_object:
	rm -f 91menu.o drw.o utf8.o util.o
clean:
	rm -f 91menu-o 91menu.o drw.o utf8.o util.o *.core
	[ -e config.h ] || cp config.def.h config.h

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -r 91menu-o ${DESTDIR}${PREFIX}/bin
	cp -r 91menu ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/91menu-o
	chmod 755 ${DESTDIR}${PREFIX}/bin/91menu
	sed "s/VERSION/${VERSION}/g" <91menu.1 >${DESTDIR}${MANPREFIX}/man1/91menu.1


uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/91menu-o
	rm -f ${DESTDIR}${MANPREFIX}/man1/91menu.1

.PHONY: all options clean install uninstall
