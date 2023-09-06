vim.cmd("autocmd!")

-- basic settings -- 
vim.scriptencoding = "utf-8"
vim.wo.rnu         = true
vim.wo.number      = true

-- clipboard --
local clipboardname
local plus_copy
local star_copy
local plus_paste
local star_paste
local cache_enabled = 0
if vim.loop.os_uname().sysname == 'Darwin' then
  clipboardname = 'macOS-clipboard'
  plus_copy     = 'pbcopy'
  plus_paste    = 'pbpaste'
  star_copy     = 'pbcopy'
  star_paste    = 'pbpaste'
  cache_enabled = 0
elseif vim.loop.os_uname().sysname == 'Linux' then
  if os.getenv('WAYLAND_DISPLAY') ~= nil then
    clipboardname = 'linux-wayland-clipboard'
    plus_copy     = 'wl-copy'
    plus_paste    = {'wl-paste', '-n'}
    star_copy     = 'wl-copy'
    star_paste    = {'wl-paste', '-n'}
    cache_enabled = 0
  elseif os.getenv('DISPLAY') ~= nil then
    clipboardname = 'linux-display-clipboard'
    plus_copy     = {'xclip', '-i'}
    plus_paste    = {'xclip', '-o'}
    star_copy     = {'xclip', '-i'}
    star_paste    = {'xclip', '-o'}
    cache_enabled = 0
  end
end
vim.g.clipboard = {
  name = clipboardname,
  copy = {
    ['+'] = plus_copy,
    ['*'] = star_copy,
  },
  paste = {
    ['+'] = plus_paste,
    ['*'] = star_paste,
  },
  cache_enabled = cache_enabled,
}
