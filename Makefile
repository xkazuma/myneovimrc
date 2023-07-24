all: 
# setup nvim
ifeq (,$(wildcard ~/.config/nvim))
	mkdir ~/.config/nvim/plugins -p
endif
ifeq (,$(wildcard ~/.cache/dein))
	mkdir ~/.cache/dein -p
endif
ifeq (,$(wildcard ~/.local/share))
	mkdir ~/.local/share 
endif

clean:
	rm -rf ~/.config/nvim ~/cache/dein ~/.local/share/dein ~/.local/share/nvim
	mkdir ~/.config/nvim

vim-hybrid: all
	curl -fLo ~/.config/nvim/autoload/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
	# config files
	cp  ./init.vim ~/.config/nvim/ 

vscode:
	cp init-vscode.vim ~/.config/nvim

pure-lua: clean
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
	# config files
	cp -rf ./init.lua ~/.config/nvim/ 
	cp -rf ./lua      ~/.config/nvim/ 
	@make magma-nvim

magma-nvim:
	@echo "sudo apt install python3 python3-pip python3-venv kitty cairosvg pnglatex plotly kaleido"
	@echo "python3 -m venv venv & source venv/bin/activate & pip install neovim jupyter jupyter-client"
	@echo ":MagmaInit python3"
