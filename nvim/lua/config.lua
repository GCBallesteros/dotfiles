local HOME = vim.env.HOME

return {
  -- Colorscheme: neon / tokyonight / catppuccin / material
  colorscheme = "neon",
  python3_host = HOME .. "/.pyenv/versions/neovim3/bin",
  startify_repos = {
    {
      line = "TTTR Toolbox",
      path = "~/Documents/RandomProjects/tttr-toolbox/tttr-toolbox/src/main.rs",
    },
  },
  startify_bookmarks = {
    "~/.config/nvim/",
    "~/.zshrc",
  },
}
