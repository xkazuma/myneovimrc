local ib = require('indent_blankline')

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#363422 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#463422 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#564432 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#665442 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#766452 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#867462 gui=nocombine]]

ib.setup {
    space_char_blankline = ' ',
    char_highlight_list  = {
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent2',
        'IndentBlanklineIndent3',
        'IndentBlanklineIndent4',
        'IndentBlanklineIndent5',
        'IndentBlanklineIndent6',
    },
}
