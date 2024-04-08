CC = cc
CFLAGS = -Wall
PORTNAME = helloworld
PORTVERSION = 1.0.0
PREFIX = /usr/local

all: helloworld

helloworld: helloworld.c
	$(CC) $(CFLAGS) -o helloworld helloworld.c

clean:
	rm -f helloworld
	rm -f helloworld-1.0.0.pkg
clean-all: clean
	rm /usr/local/bin/helloworld
	rm /usr/local/etc/rc.d/helloworld

.PHONY: all install clean package

install:
	install -d ${DESTDIR}${PREFIX}/bin
	install -m 755 helloworld ${DESTDIR}${PREFIX}/bin
	cp files/helloworld.rc /usr/local/etc/rc.d/helloworld

package: helloworld install
	pkg create -M files/+MANIFEST -o .

