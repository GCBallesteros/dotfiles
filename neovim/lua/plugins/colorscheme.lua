return {
  { "rose-pine/neovim", priority = 1000, name = "rose-pine", opts = { variant = "moon" } },
  { "xero/miasma.nvim", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      opts.colorscheme = mg.colorscheme
      return opts
    end,
  },
}
