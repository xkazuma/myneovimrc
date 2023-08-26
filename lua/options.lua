local options = {
	background     = 'dark',
	backup         = false,
	backupskip     = { '/tmp/*', '/private/tmp/*' },
	clipboard      = 'unnamedplus',
	cmdheight      = 2,
	completeopt    = { 'menuone', 'noselect' },
	conceallevel   = 0,
	cursorline     = true,
	encoding       = 'utf-8',
	expandtab      = true,
	fileencoding   = 'utf-8',
	guifont        = 'HackGen Console NF:h17',
	hlsearch       = true,
	ignorecase     = true,
	mouse          = '',
	number         = true,
	numberwidth    = 4,
	pumblend       = 5,
	pumheight      = 10,
	relativenumber = true,
	scrolloff      = 8,
	shell          = 'bash',
	shiftwidth     = 2,
	showmode       = false,
	showtabline    = 2,
	sidescrolloff  = 8,
	signcolumn     = 'yes',
	smartcase      = true,
	smartindent    = true,
	splitbelow     = true,
	splitright     = true,
	swapfile       = false,
	tabstop        = 2,
	termguicolors  = true,
	timeoutlen     = 900,
	title          = true,
	undofile       = true,
	updatetime     = 400,
	wildoptions    = 'pum',
	winblend       = 0,
	wrap           = true,
	writebackup    = false,
  list           = true,
}

vim.opt.listchars:append('space:⋅')
vim.opt.listchars:append('eol:↴')
vim.opt.shortmess:append('c')

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.cmd([[set iskeyword+=-]])
