local g = vim.g

vim.api.nvim_command "colorscheme tokyonight"

require("lualine").setup({
  options = {
    theme = "tokyonight",
  },
})
