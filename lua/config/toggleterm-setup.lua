local tt = require('toggleterm')
local br = require('bufresize')

tt.setup({
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping      = [[<c-t>]],
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


ToggleTerm = function(direction)
    local command = 'ToggleTerm'
    if direction == 'horizontal' then
        command = command .. ' direction=horizontal'
    elseif direction == 'vertical' then
        command = command .. ' direction=vertical'
    end
    if vim.bo.filetype == 'toggleterm' then
        br.block_register()
        vim.api.nvim_command(command)
        br.resize_close()
    else
        br.block_register()
        vim.api.nvim_command(command)
        br.resize_open()
        vim.cmd([[execute 'normal! i']])
    end
end

function _G.set_terminal_keymaps()
  local opts = {buffer = 0, noremap = true, silent = true}
  vim.keymap.set('n', '<C-t>',  ':lua ToggleTerm()<cr>'              , opts)
  vim.keymap.set('n', '<C-t>h', [[:lua ToggleTerm('horizontal')<cr>]], opts)
  vim.keymap.set('n', '<C-t>v', [[:lua ToggleTerm('vertical')<cr>]],   opts)
  vim.keymap.set('t', '<esc>',  [[<C-\><C-n>]],                        opts)
  vim.keymap.set('t', '<C-[>',  [[<C-\><C-n>]],                        opts)
  vim.keymap.set('t', '<C-h>',  [[<Cmd>wincmd h<CR>]],                 opts)
  vim.keymap.set('t', '<C-j>',  [[<Cmd>wincmd j<CR>]],                 opts)
  vim.keymap.set('t', '<C-k>',  [[<Cmd>wincmd k<CR>]],                 opts)
  vim.keymap.set('t', '<C-l>',  [[<Cmd>wincmd l<CR>]],                 opts)
  vim.keymap.set('t', '<C-w>',  [[<C-\><C-n><C-w>]],                   opts)
  vim.keymap.set('t', '<C-t>',  '<C-\\><C-n>:lua ToggleTerm()<cr>',    opts)
  vim.keymap.set('i', '<C-t>',  '<esc>:lua ToggleTerm()<cr>',          opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
