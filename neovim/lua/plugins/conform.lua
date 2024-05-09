return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      nix = { "nixfmt" },
    },
    formatters = {
      prettier = { prepend_args = { "--single-quote" } },
    },
  },
}
