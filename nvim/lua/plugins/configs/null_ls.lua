local null_ls = require "null-ls"
local h = require "null-ls.helpers"

local black = {
  name = "grey",
  method = null_ls.methods.FORMATTING,
  filetypes = { "python" },
  generator = h.formatter_factory({
    command = vim.fn.expand(require("config").python3_host .. "/black"),
    args = {
      "--stdin-filename",
      "$FILENAME",
      "--quiet",
      "-",
    },
    to_stdin = true,
  }),
}

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua.with({
      extra_args = { "--indent-type", "Spaces", "--indent-width", "2", "--call-parentheses", "NoSingleString" },
    }),
    null_ls.builtins.diagnostics.flake8,
  },
})

null_ls.register({ black })
