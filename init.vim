""""""""""""""""""""""""""""""""""""""""""""""""""""
"" fundamental function
""""""""""""""""""""""""""""""""""""""""""""""""""""
" show line number
set nu

" use white space instead of tab
set expandtab

" enables us to switch suitable indent depth 
" according to the program language
set smartindent

" depth of indent for smartindent (#white spaces)
set shiftwidth=2

" input #white spaces when entering tab key
set softtabstop=2

" character-encoding for buffer
set encoding=utf-8

" syncronize registers of vim and clipboard on the system
set clipboard+=unnamed,unnamedplus

" autocomplete the path when e-command mode
set wildmode=longest,full

""""""""""""""""""""""""""""""""""""""""""""""""""""
"" package
""""""""""""""""""""""""""""""""""""""""""""""""""""
"neovim + vim
let s:jetpackfile = stdpath('data') .. '/site/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

" + - - - - - + - - - - - - - - - - + - - - - - - - - - - - - - - - - - +
" | Parameter | Type                | Description                       |
" + - - - - - + - - - - - - - - - - + - - - - - - - - - - - - - - - - - +
" | on        | string or array     | On-demand loading plugins by      |
" |           |                     | commands, keymaps.                |
" + - - - - - + - - - - - - - - - - + - - - - - - - - - - - - - - - - - +
" | for       | string or array     | On-demand loading plugins by      |
" |           |                     | filetypes.                        |
" + - - - - - + - - - - - - - - - - + - - - - - - - - - - - - - - - - - +
" | branch    | string              | Install plugins from the          |
" |           |                     | specified branch.                 |
" + - - - - - + - - - - - - - - - - + - - - - - - - - - - - - - - - - - +
" | commit    | string              | Install plugins from the          |
" |           |                     | specified branch.                 |
" + - - - - - + - - - - - - - - - - + - - - - - - - - - - - - - - - - - +
" | tag       | string              | Install plugins from the          |
" |           |                     | specified tags.                   |
" + - - - - - + - - - - - - - - - - + - - - - - - - - - - - - - - - - - +
" | rtp       | string              | Add the specified directory to    |
" |           |                     | the runtimepath.                  |
" + - - - - - + - - - - - - - - - - + - - - - - - - - - - - - - - - - - +
" | do        | string or function  | Execute the specified command     |
" |           |                     | after installation.               |
" + - - - - - + - - - - - - - - - - + - - - - - - - - - - - - - - - - - +
" | as        | string              | Install plugins as the specified  |
" |           |                     | name.                             |
" + - - - - - + - - - - - - - - - - + - - - - - - - - - - - - - - - - - +
" | dir       | string              | Install plugins to the specified  |
" |           |                     | directory.                        |
" + - - - - - + - - - - - - - - - - + - - - - - - - - - - - - - - - - - +
" | frozen    | boolean             | Freeze plugins to the current     |
" |           |                     | version.                          |
" + - - - - - + - - - - - - - - - - + - - - - - - - - - - - - - - - - - +

call jetpack#begin()
  " bootstrap
  Jetpack 'tani/vim-jetpack',        { 'opt': 1 }
  
  "" Enhanced editor plugin
  " autoclose
  Jetpack 'Townk/vim-autoclose',             { 'opt': 0 }
  Jetpack 'nathanaelkane/vim-indent-guides', { 'opt': 0 }

  " cheatsheet
  Jetpack 'reireias/vim-cheatsheet', { 'opt': 1 }

  " git-related
  Jetpack 'tpope/vim-fugitive',      { 'opt': 1 }
  Jetpack 'airblade/vim-gitgutter',  { 'opt': 1 }


call jetpack#end()
