local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- Python LSP Configuration
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require'lspconfig'.pyright.setup{
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
            },
        }
    },
    capabilities=capabilities,
}

-- Rust LSP Configuration
require'lspconfig'.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
            checkOnSave = {
                command = "clippy"
            },
        }
    },
    capabilities=capabilities,
})
