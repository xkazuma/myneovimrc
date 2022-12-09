all: clean jetpack
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
	# config files
	cp  ./init.vim       ~/.config/nvim/ 

clean:
	rm -rf ~/.config/nvim ~/cache/dein ~/.local/share/dein

jetpack:
	curl -fLo ~/.config/nvim/autoload/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
