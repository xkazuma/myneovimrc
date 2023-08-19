vim.opt.termguicolors = true
require('bufferline').setup({
  options = {
    mode                    = "buffers",
    separator_style         = 'slant',
    always_show_bufferline  = false,
    show_buffer_close_icons = false,
    show_close_icon         = false,
    color_icons             = true,
    --- count is an integer representing total count of errors
    --- level is a string "error" | "warning"
    --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
    --- this should return a string
    --- Don't get too fancy as this function will be executed a lot
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    --- SIDEBAR OFFSET                                           *bufferline-offset*
    --- 
    --- You can prevent the bufferline drawing above a *vertical* sidebar split such as a file explorer.
    --- To do this you must set the `offsets` configuration option to a list of tables
    --- containing the details of the window to avoid. *NOTE:* this is only relevant
    --- for left or right aligned sidebar windows such as `NvimTree`, `NERDTree` or
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
