-- ========== options ==========
vim.o.number = true
vim.opt.winborder = "rounded"
vim.o.relativenumber = true
vim.wo.signcolumn = "yes"
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.wrap = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.cursorline = false
vim.o.swapfile = false
vim.o.autoindent = true
vim.o.termguicolors = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- ========== plugins ==========
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-buffer" },
	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/hrsh7th/cmp-cmdline" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/numToStr/FTerm.nvim" },
})

-- load plugin configs
require("plugins.oil")
require("plugins.mini-pick")
require("plugins.gitsigns")
require("plugins.cmp")
require("plugins.autopairs")
require("plugins.lsp")
require("plugins.fterm")


-- ========== keymaps ==========
vim.keymap.set('n', '<leader>o', ":update<CR>:source<CR>")
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '\\', ":Oil<CR>")
vim.keymap.set('n', '<leader>w', ":write<CR>")
vim.keymap.set('n', '<leader>q', ":quit<CR>")
-- clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)
-- terminal toggle at current directory
vim.keymap.set('n', '<leader>t', function()
    local file_dir = vim.fn.expand('%:p:h')
    if file_dir ~= "" then
        vim.cmd('lcd ' .. file_dir)
    end
    require('FTerm').toggle()
end)


-- ========== ui/theme ==========
vim.cmd("colorscheme vague")
vim.cmd("hi statusline guibg=NONE")
vim.cmd [[highlight Normal guibg=none]]
vim.cmd [[highlight NonText guibg=none]]
vim.cmd [[highlight SignColumn guibg=none]]

-- Set cursor shape on exit
vim.cmd [[ autocmd VimLeave * set guicursor=a:ver25-blinkon750-blinkoff400-blinkwait300 ]]

