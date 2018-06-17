#!/bin/sh
#
if [ "$OSTYPE" = "linux-gnu" ]; then
       LINKFLAGS=`pkg-config --libs gobject-2.0 glib-2.0 | tr ' ' '\n' | sed 's/^/-Xlinker /' | tr '\n' ' '`
       CCFLAGS=`pkg-config --cflags gobject-2.0 glib-2.0 | tr ' ' '\n' | sed 's/^/-Xcc /' | tr '\n' ' ' `
       exec swift build $CCFLAGS $LINKFLAGS "$@"
   
elif [ "$OSTYPE" = "darwin" ]; then
       export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
       exec swift build -Xlinker -L/usr/local/lib -Xcc -I/usr/local/include/glib-2.0/ -Xcc -I/usr/local/include "$@"
fi
