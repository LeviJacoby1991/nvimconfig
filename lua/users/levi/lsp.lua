local lsp = require'lspconfig'

local on_attach = function (client, bufnr)
  local map = function(mode, lhs, rhs)
    local options = { noremap = true, silent = true, buffer = bufnr }
    if opts then 
      options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
  end
  map('n', 'K', vim.lsp.buf.hover)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
end


lsp['gopls'].setup {
  on_attach = on_attach,
}
