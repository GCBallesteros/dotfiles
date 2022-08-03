local null_ls = require "null-ls"

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.flake8.with({extra_args={"--ignore-errors", "E402"}}),
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
  },
})
