all: 
# setup nvim
ifeq (,$(wildcard ~/.config/nvim))
	mkdir ~/.config/nvim/plugins -p
endif
ifeq (,$(wildcard ~/.cache/dein))
	mkdir ~/.cache/dein -p
endif
ifeq (,$(wildcard ~/.local/share))
	mkdir ~/.local/share -p
endif

clean:
	rm -rf ~/.config/nvim ~/cache/dein ~/.local/share/dein ~/.local/share/nvim
	mkdir -p ~/.config/nvim

vim-hybrid: all
	curl -fLo ~/.config/nvim/autoload/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
	# config files
	cp  -f ./init.vim ~/.config/nvim/ 

vscode:
	cp -f init-vscode.vim ~/.config/nvim

install-pure-lua: clean
ifeq (,$(wildcard ~/.local/share/nvim/site/pack/packer))
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
endif
	# install deno
	sh ./installer/deno/install.sh
	# install nodejs
	sh ./installer/nodejs/install.sh 
	# config files
	cp -rf ./init.lua ~/.config/nvim/ 
	cp -rf ./lua      ~/.config/nvim/ 
	mkdir -p ~/.local/bin
	ln ./docker/compose/nvim-texlive-env/bin/latexmk ~/.local/bin -f 
	ln ./docker/compose/nvim-texlive-env/bin/qpdfview ~/.local/bin -f 
  
	@make neovim
	@make magma-nvim
	@make vimtex

install-pure-lua-for-docker: 
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
	# config files
	mkdir -p ~/.config/nvim/after/ftplugin
	cp ./after/rust.lua ~/.config/nvim/after/ftplugin/rust.lua
	cp -rf ./init.lua   ~/.config/nvim/
	cp -rf ./lua        ~/.config/nvim/
	mkdir -p ~/.local/bin
	echo export PATH=~/.local/bin:$$PATH >> ~/.bashrc
	@make neovim
	@make vimtex

neovim:
	@echo "######### First ##############################################"
	@echo "Load plugins to execute below commands:"
	@echo "nvim +:q && nvim --headless '+Lazy! sync' +qa"

magma-nvim:
	@echo "######### How to instal magma ##############################################"
	@echo "sudo apt install python3 python3-pip python3-venv kitty cairosvg pnglatex plotly kaleido"
	@echo "python3 -m venv venv & source venv/bin/activate & pip install neovim jupyter jupyter-client"
	@echo ":MagmaInit python3"

vimtex:
	@echo "######### How to setup vimtex ##############################################"
	@echo "Execute following commands:"
	@echo "cd myneovimrc/docker/compose/nvim-texlive-env"
	@echo "echo USERID=$$(id -u)   > .env"
	@echo "echo GROUPID=$$(id -g) >> .env"
	@echo "docker compose build"

update-conf: 
	# config files
	mkdir -p ~/.config/nvim/after/ftplugin
	cp ./after/rust.lua ~/.config/nvim/after/ftplugin/rust.lua
	cp -rf ./init.lua   ~/.config/nvim/ 
	cp -rf ./lua        ~/.config/nvim/ 
