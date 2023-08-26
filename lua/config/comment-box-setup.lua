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

-- open catalog
keymap('n', '<leader>bc',   cb.catalog,  {})

-- comment box
local boxn = 22
for i=1,boxn do
  keymap({'n', 'x'}, '<leader>bll' .. string.format('%02d', i), cb.llbox(i),  {})
  keymap({'n', 'x'}, '<leader>blc' .. string.format('%02d', i), cb.lcbox(i),  {})
  keymap({'n', 'x'}, '<leader>blr' .. string.format('%02d', i), cb.lrbox(i),  {})
  keymap({'n', 'x'}, '<leader>bcl' .. string.format('%02d', i), cb.clbox(i),  {})
  keymap({'n', 'x'}, '<leader>bcc' .. string.format('%02d', i), cb.ccbox(i),  {})
  keymap({'n', 'x'}, '<leader>bcr' .. string.format('%02d', i), cb.crbox(i),  {})
  keymap({'n', 'x'}, '<leader>brl' .. string.format('%02d', i), cb.rlbox(i),  {})
  keymap({'n', 'x'}, '<leader>brc' .. string.format('%02d', i), cb.rcbox(i),  {})
  keymap({'n', 'x'}, '<leader>brr' .. string.format('%02d', i), cb.rrbox(i),  {})
  keymap({'n', 'x'}, '<leader>bal' .. string.format('%02d', i), cb.albox(i),  {})
  keymap({'n', 'x'}, '<leader>bac' .. string.format('%02d', i), cb.acbox(i),  {})
  keymap({'n', 'x'}, '<leader>bar' .. string.format('%02d', i), cb.arbox(i),  {})
end


-- comment line
local linen = 10
for i=1,linen do
  keymap('n', '<leader>blil' .. string.format('%02d', i), cb.lline(i),  {})
  keymap('n', '<leader>blic' .. string.format('%02d', i), cb.cline(i),  {})
  keymap('n', '<leader>blir' .. string.format('%02d', i), cb.rline(i),  {})
  keymap('i', '<C-l>l', cb.lline, {})
  keymap('i', '<C-l>c', cb.cline, {})
  keymap('i', '<C-l>r', cb.rline, {})
end
