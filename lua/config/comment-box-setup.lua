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
keymap('n',        '<leader>cbc',   cb.catalog,  {})

-- comment box
local boxn = 22
for i=1,boxn do
  keymap({'n', 'v'}, '<leader>cbll' .. string.format('%02d', i), cb.llbox(i),  {})
  keymap({'n', 'v'}, '<leader>cblc' .. string.format('%02d', i), cb.lcbox(i),  {})
  keymap({'n', 'v'}, '<leader>cblr' .. string.format('%02d', i), cb.lrbox(i),  {})
  keymap({'n', 'v'}, '<leader>cbcl' .. string.format('%02d', i), cb.clbox(i),  {})
  keymap({'n', 'v'}, '<leader>cbcc' .. string.format('%02d', i), cb.ccbox(i),  {})
  keymap({'n', 'v'}, '<leader>cbcr' .. string.format('%02d', i), cb.crbox(i),  {})
  keymap({'n', 'v'}, '<leader>cbrl' .. string.format('%02d', i), cb.rlbox(i),  {})
  keymap({'n', 'v'}, '<leader>cbrc' .. string.format('%02d', i), cb.rcbox(i),  {})
  keymap({'n', 'v'}, '<leader>cbrr' .. string.format('%02d', i), cb.rrbox(i),  {})
  keymap({'n', 'v'}, '<leader>cbal' .. string.format('%02d', i), cb.albox(i),  {})
  keymap({'n', 'v'}, '<leader>cbac' .. string.format('%02d', i), cb.acbox(i),  {})
  keymap({'n', 'v'}, '<leader>cbar' .. string.format('%02d', i), cb.arbox(i),  {})
end

-- comment line
local linen = 10
for i=1,linen do
  keymap('n', '<leader>cbll' .. string.format('%02d', i), cb.lline(i),  {})
  keymap('n', '<leader>cblc' .. string.format('%02d', i), cb.cline(i),  {})
  keymap('n', '<leader>cblr' .. string.format('%02d', i), cb.rline(i),  {})
  keymap('i', '<M-l>l', cb.lline, {})
  keymap('i', '<M-l>c', cb.cline, {})
  keymap('i', '<M-l>r', cb.rline, {})
end
