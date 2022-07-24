local null_ls = require "null-ls"

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua.with({
      extra_args = { "--indent-type", "Spaces", "--indent-width", "2", "--call-parentheses", "NoSingleString" },
    }),
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.black,
  },
})
