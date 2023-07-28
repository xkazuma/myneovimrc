#!/bin/sh
curl -fsSL https://deno.land/install.sh | sh -s v1.35.3 \
	&& ln -f ~/.deno/bin/deno ~/.local/bin/deno
