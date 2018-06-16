#!/bin/sh
#
if [ "$OSTYPE" = "linux-gnu" ]; then
      exec swift build -Xlinker -L/usr/lib -Xcc -I/usr/include/glib-2.0/ -Xcc -I/usr/include "$@"
elif [ "$OSTYPE" = "darwin" ]; then
       export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
       exec swift build -Xlinker -L/usr/local/lib -Xcc -I/usr/local/include/glib-2.0/ -Xcc -I/usr/local/include "$@"
fi
