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

vim-hybrid: all
	curl -fLo ~/.config/nvim/autoload/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
	# config files
	cp  ./init.vim ~/.config/nvim/ 

pure-nvim: all
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
	# config files
	cp     ./init.lua ~/.config/nvim/ 
	cp -rf ./lua      ~/.config/nvim/ 
