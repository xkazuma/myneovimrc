vim.cmd [[
  try
    colorscheme melange
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]

-- colorscheme jellybeans
