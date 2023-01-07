local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal -- 
keymap("n", "<C-f>", ":NvimTreeToggle<Return>", opts)
keymap("n", "<C-s>", ":T<Return>",              opts)

-- Terminal -- 
keymap("t", "<C-f>",        ":NvimTreeToggle<Return>", opts)
keymap("t", "<ESC>",        "<C-\\><C-n>",             opts)
keymap("t", "<C-[>",        "<C-\\><C-n>",             opts)
keymap("t", "<C-W>n",       "<cmd>new<cr>",            opts)
keymap("t", "<C-W><C-N>",   "<cmd>new<cr>",            opts)
keymap("t", "<C-W>q",       "<cmd>quit<cr>",           opts)
keymap("t", "<C-W><C-Q>",   "<cmd>quit<cr>",           opts)
keymap("t", "<C-W>c",       "<cmd>close<cr>",          opts)
keymap("t", "<C-W>o",       "<cmd>only<cr>",           opts)
keymap("t", "<C-W><C-O>",   "<cmd>only<cr>",           opts)
keymap("t", "<C-W><Down>",  "<cmd>wincmd j<cr>",       opts)
keymap("t", "<C-W><C-J>",   "<cmd>wincmd j<cr>",       opts)
keymap("t", "<C-W>j",       "<cmd>wincmd j<cr>",       opts)
keymap("t", "<C-W><Up>",    "<cmd>wincmd k<cr>",       opts)
keymap("t", "<C-W><C-K>",   "<cmd>wincmd k<cr>",       opts)
keymap("t", "<C-W>k",       "<cmd>wincmd k<cr>",       opts)
keymap("t", "<C-W><Left>",  "<cmd>wincmd h<cr>",       opts)
keymap("t", "<C-W><C-H>",   "<cmd>wincmd h<cr>",       opts)
keymap("t", "<C-W><BS>",    "<cmd>wincmd h<cr>",       opts)
keymap("t", "<C-W>h",       "<cmd>wincmd h<cr>",       opts)
keymap("t", "<C-W><Right>", "<cmd>wincmd l<cr>",       opts)
keymap("t", "<C-W><C-L>",   "<cmd>wincmd l<cr>",       opts)
keymap("t", "<C-W>l",       "<cmd>wincmd l<cr>",       opts)
keymap("t", "<C-W>w",       "<cmd>wincmd w<cr>",       opts)
keymap("t", "<C-W><C-W>",   "<cmd>wincmd w<cr>",       opts)
keymap("t", "<C-W>W",       "<cmd>wincmd W<cr>",       opts)
keymap("t", "<C-W>t",       "<cmd>wincmd t<cr>",       opts)
keymap("t", "<C-W><C-T>",   "<cmd>wincmd t<cr>",       opts)
keymap("t", "<C-W>b",       "<cmd>wincmd b<cr>",       opts)
keymap("t", "<C-W><C-B>",   "<cmd>wincmd b<cr>",       opts)
keymap("t", "<C-W>p",       "<cmd>wincmd p<cr>",       opts)
keymap("t", "<C-W><C-P>",   "<cmd>wincmd p<cr>",       opts)
keymap("t", "<C-W>P",       "<cmd>wincmd P<cr>",       opts)
keymap("t", "<C-W>r",       "<cmd>wincmd r<cr>",       opts)
keymap("t", "<C-W><C-R>",   "<cmd>wincmd r<cr>",       opts)
keymap("t", "<C-W>R",       "<cmd>wincmd R<cr>",       opts)
keymap("t", "<C-W>x",       "<cmd>wincmd x<cr>",       opts)
keymap("t", "<C-W><C-X>",   "<cmd>wincmd x<cr>",       opts)
keymap("t", "<C-W>K",       "<cmd>wincmd K<cr>",       opts)
keymap("t", "<C-W>J",       "<cmd>wincmd J<cr>",       opts)
keymap("t", "<C-W>H",       "<cmd>wincmd H<cr>",       opts)
keymap("t", "<C-W>L",       "<cmd>wincmd L<cr>",       opts)
keymap("t", "<C-W>T",       "<cmd>wincmd T<cr>",       opts)
keymap("t", "<C-W>=",       "<cmd>wincmd =<cr>",       opts)
keymap("t", "<C-W>-",       "<cmd>wincmd -<cr>",       opts)
keymap("t", "<C-W>+",       "<cmd>wincmd +<cr>",       opts)
keymap("t", "<C-W>z",       "<cmd>pclose<cr>",         opts)
keymap("t", "<C-W><C-Z>",   "<cmd>pclose<cr>",         opts)
