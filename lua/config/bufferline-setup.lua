local bufferline = require('bufferline')
local webdevicon = require('nvim-web-devicons')

bufferline.setup({
  options = {
    mode                    = "buffers",
    style_preset            = bufferline.style_preset.no_italic,
    separator_style         = 'thin',
    always_show_bufferline  = true,
    show_buffer_close_icons = true,
    show_close_icon         = true,
    color_icons             = true,
    get_element_icon        = function(element)
      local icon, hl = webdevicon.get_icon_by_filetype(element.filetype, { default = false })
      return icon, hl
    end,
    diagnostics             = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    offsets = {
      {
        filetype  = "NvimTree",
        text      = "File Explorer",
        highlight = "Directory",
        separator = true -- use a "true" to enable the default, or set your own character
      }
    },
    groups = {
      options = {
        toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        {
          name      = "Tests", -- Mandatory
          highlight = {underline = true, sp = "blue"}, -- Optional
          priority  = 2, -- determines where it will appear relative to other groups (Optional)
          icon      = "", -- Optional
          matcher   = function(buf) -- Mandatory
            return buf.name:match('%_test') or buf.name:match('%_spec')
          end,
        },
        {
          name       = "Docs",
          highlight  = {undercurl = true, sp = "green"},
          auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
          matcher    = function(buf)
            return buf.name:match('%.md')
          end,
        },
        {
          name       = "TeX",
          highlight  = {undercurl = true, sp = "green"},
          auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
          matcher    = function(buf)
            return buf.name:match('%.tex')
          end,
        },
        {
          name       = "Logs",
          highlight  = {undercurl = true, sp = "yellow"},
          auto_close = false,
          matcher    = function(buf)
            return buf.name:match('%.log') or buf.name:match('%.txt')
          end,
        }
      }
    },
  },
})

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap({'n',}, '<leader>bp',  '<cmd> BufferLineTogglePin<cr>',  opts) -- Toggle Pin
keymap({'n',}, '<leader>bb',  '<cmd> BufferLinePick<cr>',       opts) -- Open a buffer
keymap({'n',}, '<leader>b[',  '<cmd> BufferLineCyclePrev<cr>',  opts) -- Open the next (right) buffer
keymap({'n',}, '<leader>b]',  '<cmd> BufferLineCycleNext<cr>',  opts) -- Open the previous (left) buffer
keymap({'n',}, '<leader>bx',  '<cmd> BufferLinePickClose<cr>',  opts) -- Close a buffer
keymap({'n',}, '<leader>bXr', '<cmd> BufferLineCloseRight<cr>', opts) -- Close buffers on the right
keymap({'n',}, '<leader>bXl', '<cmd> BufferLineCloseLeft<cr>',  opts) -- Close buffers on the left
keymap({'n',}, '<leader>bXo', '<cmd> BufferLineCloseOther<cr>', opts) -- Close other buffers
keymap({'n',}, '<leader>bXg', ':BufferLineGroupClose ',         opts) -- Close buffers grouped in specified nam e
keymap({'n',}, '<leader>bm[', '<cmd> BufferLineMovePrev<cr>',   opts) -- Move the current buffer to previous
keymap({'n',}, '<leader>bm]', '<cmd> BufferLineMoveNext<cr>',   opts) -- Move the current buffer to next
keymap({'n',}, '<leader>bg', ':BufferLineToggleGroup ',         opts) -- Toggle group
