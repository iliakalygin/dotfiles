local ok_mason, mason = pcall(require, "mason")
if ok_mason then mason.setup() end

require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },
})

local lspconfig = require("lspconfig")
local cmp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()
if cmp_ok then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
  end
  map("n", "K", vim.lsp.buf.hover)
  map("n", "gd", vim.lsp.buf.definition)
  map("n", "gD", vim.lsp.buf.declaration)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "gr", vim.lsp.buf.references)
  map("n", "<leader>rn", vim.lsp.buf.rename)
  map("n", "<leader>ca", vim.lsp.buf.code_action)
  map("n", "[d", vim.diagnostic.goto_prev)
  map("n", "]d", vim.diagnostic.goto_next)
  map("n", "<leader>e", function() vim.diagnostic.open_float(nil, { border = "rounded" }) end)
  map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)
end

-- c++ lsp
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
  init_options = { clangdFileStatus = true },
})



