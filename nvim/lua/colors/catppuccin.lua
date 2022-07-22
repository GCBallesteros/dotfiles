local g = vim.g

g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
  compile = {
    enabled = true,
  },
  integrations = {
    cmp = true,
    telescope = true,
    nvimtree = {
      enabled = false,
    },
    dashboard = false,
    lightspeed = true,
  },
})

require("lualine").setup({
  options = { theme = "solarized_light" },
})

vim.api.nvim_command "colorscheme catppuccin"
