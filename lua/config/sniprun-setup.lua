local sniprun = require('sniprun')

sniprun.setup({
    display         = {
      "LongTempFloatingWindow",
    },
    display_options = {
        terminal_scrollback  = vim.o.scrollback, -- change terminal display scrollback lines
        terminal_line_number = false, -- whether show line number in terminal window
        terminal_signcolumn  = false, -- whether show signcolumn in terminal window
        terminal_width       = 45,
    },
})
