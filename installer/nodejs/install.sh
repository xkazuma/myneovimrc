#!/bin/sh
cd installer/nodejs \
  && rm -rf node-v18.17.0-linux-x64 \
  && wget https://nodejs.org/dist/v18.17.0/node-v18.17.0-linux-x64.tar.xz \
  && tar xf node-v18.17.0-linux-x64.tar.xz \
  && rm ./node-v18.17.0-linux-x64.tar.xz \
  && ln -f node-v18.17.0-linux-x64/bin/node ~/.local/bin \
  && NPMPATH=$(find $(pwd)/node-v18.17.0-linux-x64/bin/ -name "npm") \
  && NPXPATH=$(find $(pwd)/node-v18.17.0-linux-x64/bin/ -name "npx") \
  && echo "#!/bin/bash" > bin/npm \
  && echo "#!/bin/bash" > bin/npx \
  && echo "${NPMPATH} \$*" >> bin/npm \
  && echo "${NPXPATH} \$*" >> bin/npx \
  && ln -f bin/npm ~/.local/bin \
  && ln -f bin/npx ~/.local/bin