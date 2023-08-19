local tt = require("toggleterm")

tt.setup({
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping      = [[<c-\]],
  start_in_insert   = true,
  insert_mappings   = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size      = true,
  persist_mode      = true, -- if set to true (default) the previous terminal mode will be remembered
  direction         = 'horizontal',
  close_on_exit     = true, -- close the terminal window when the process exits
                            -- Change the default shell. Can be a string or a function returning a string
  shell             = vim.o.shell,
  auto_scroll       = true, -- automatically scroll to the bottom on terminal output
  winbar            = {
    enabled        = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.cmd('autocmd! TermEnter term://*toggleterm#* tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>')

--  By applying the mappings this way you can pass a count to your
--  mapping to open a specific window.
--  For example: 2<C-t> will open terminal 2
vim.keymap.set({'i', 'n', 't'}, '<c-t>', '<Cmd>exe v:count1 . "ToggleTerm"<cr>',      { noremap = true, silent = true})
vim.keymap.set({'i', 'n', 't'}, '<c-t>', '<Esc><Cmd>exe v:count1 . "ToggleTerm"<cr>', { noremap = true, silent = true})
