#!/bin/sh
cd installer/nodejs \
  && rm -rf node-v18.17.0-linux-x64 \
  && wget https://nodejs.org/dist/v18.17.0/node-v18.17.0-linux-x64.tar.xz \
  && tar xf node-v18.17.0-linux-x64.tar.xz \
  && rm ./node-v18.17.0-linux-x64.tar.xz \
  && ln -f node-v18.17.0-linux-x64/bin/node ~/.local/bin
