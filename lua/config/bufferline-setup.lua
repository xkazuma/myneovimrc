vim.opt.termguicolors = true
require('bufferline').setup({
  options = {
    mode                    = "buffers",
    separator_style         = 'slant',
    always_show_bufferline  = false,
    show_buffer_close_icons = false,
    show_close_icon         = false,
    color_icons             = true,
    get_element_icon        = function(element)
      local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
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
  },
})
