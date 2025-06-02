require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- Plugins
require('lazy').setup({
    require 'plugins.bufferline',
    require 'plugins.colortheme',
    require 'plugins.neotree',
    require 'plugins.lualine',
    require 'plugins.telescope',
    require 'plugins.gitsigns',
    require 'plugins.indent-blankline',
    require 'plugins.misc',
    require 'plugins.snacks',
    require 'plugins.render-markdown',
})

-- Set cursor shape on exit
vim.cmd [[
  autocmd VimLeave * set guicursor=a:ver25-blinkon750-blinkoff400-blinkwait300
]]

-- theme
local colorscheme = "base16-black-metal-gorgoroth"
vim.cmd("colorscheme " .. colorscheme)
