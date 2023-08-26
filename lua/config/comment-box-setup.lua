local keymap = vim.keymap.set
local cb     = require('comment-box')

cb.setup({
  doc_width = 80, -- width of the document
  box_width = 70, -- width of the boxes
  borders   = {   -- symbols used to draw a box
    top          = "─",
    bottom       = "─",
    left         = "│",
    right        = "│",
    top_left     = "╭",
    top_right    = "╮",
    bottom_left  = "╰",
    bottom_right = "╯",
  },
  line_width = 70, -- width of the lines
  line       = {   -- symbols used to draw a line
    line       = "─",
    line_start = "─",
    line_end   = "─",
  },
  outer_blank_lines     = false, -- insert a blank line above and below the box
  inner_blank_lines     = true,  -- insert a blank line above and below the text
  line_blank_line_above = false, -- insert a blank line above the line
  line_blank_line_below = true,  -- insert a blank line below the line
})


local opts = { noremap = true, silent = true }
-- open catalog
keymap('n', '<leader>CC', cb.catalog, opts)

-- comment box
keymap({'n', 'x'}, '<leader>CBB',  ':lua require("comment-box").albox(3)<cr>', opts) -- default
keymap({'n', 'x'}, '<leader>Cll', ':lua require("comment-box").llbox(3)',      opts)
keymap({'n', 'x'}, '<leader>Clc', ':lua require("comment-box").lcbox(3)',      opts)
keymap({'n', 'x'}, '<leader>Clr', ':lua require("comment-box").lrbox(3)',      opts)
keymap({'n', 'x'}, '<leader>Ccl', ':lua require("comment-box").clbox(3)',      opts)
keymap({'n', 'x'}, '<leader>Ccc', ':lua require("comment-box").ccbox(3)',      opts)
keymap({'n', 'x'}, '<leader>Ccr', ':lua require("comment-box").crbox(3)',      opts)
keymap({'n', 'x'}, '<leader>Crl', ':lua require("comment-box").rlbox(3)',      opts)
keymap({'n', 'x'}, '<leader>Crc', ':lua require("comment-box").rcbox(3)',      opts)
keymap({'n', 'x'}, '<leader>Crr', ':lua require("comment-box").rrbox(3)',      opts)
keymap({'n', 'x'}, '<leader>Cal', ':lua require("comment-box").albox(3)',      opts)
keymap({'n', 'x'}, '<leader>Cac', ':lua require("comment-box").acbox(3)',      opts)
keymap({'n', 'x'}, '<leader>Car', ':lua require("comment-box").arbox(3)',      opts)
-- comment line
keymap({'n', 'x'}, '<leader>CLL',  ':lua require("comment-box").cline(2)<cr>', opts) -- default
keymap({'n', 'x'}, '<leader>CLl', ':lua require("comment-box").line(2)',      opts)
keymap({'n', 'x'}, '<leader>CLc', ':lua require("comment-box").cline(2)',      opts)
keymap({'n', 'x'}, '<leader>CLr', ':lua require("comment-box").rline(2)',      opts)
