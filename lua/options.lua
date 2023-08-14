local options = {
	encoding       = 'utf-8',
	fileencoding   = 'utf-8',
	title          = true,
	backup         = false,
	clipboard      = 'unnamedplus',
	cmdheight      = 2,
	completeopt    = { 'menuone', 'noselect' },
	conceallevel   = 0,
	hlsearch       = true,
	ignorecase     = true,
	mouse          = '',
	pumheight      = 10,
	showmode       = false,
	showtabline    = 2,
	smartcase      = true,
	smartindent    = true,
	swapfile       = false,
	termguicolors  = true,
	timeoutlen     = 900,
	undofile       = true,
	updatetime     = 400,
	writebackup    = false,
	shell          = 'bash',
	backupskip     = { '/tmp/*', '/private/tmp/*' },
	expandtab      = true,
	shiftwidth     = 2,
	tabstop        = 2,
	cursorline     = true,
	number         = true,
	relativenumber = true,
	numberwidth    = 4,
	signcolumn     = 'yes',
	wrap           = true,
	winblend       = 0,
	wildoptions    = 'pum',
	pumblend       = 5,
	background     = 'dark',
	scrolloff      = 8,
	sidescrolloff  = 8,
	guifont        = 'HackGen Console NF:h17',
	splitbelow     = true,
	splitright     = true,
}

vim.opt.shortmess:append('c')

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.cmd([[set iskeyword+=-]])
