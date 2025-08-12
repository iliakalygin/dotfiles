-- plugins/autopairs.lua
local autopairs = require("nvim-autopairs")
autopairs.setup({
    check_ts = true, -- enable treesitter checks for better pairing
    fast_wrap = {},  -- optional: fast wrap keymaps
})

-- integrate with nvim-cmp
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

