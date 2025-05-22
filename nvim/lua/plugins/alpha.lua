return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
	' _._     _,-\'""`-._    ',
	"(,-.`._,'(       |\\`-/|",
	"    `-.-' \\ )-`( , o o)",
	"          `-    \\`_`\"'-",
}

    alpha.setup(dashboard.opts)
  end,
}
