return {
  "nvim-treesitter/nvim-treesitter",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  keys = {
    { "<c-space>", desc = "Increment Selection" },
    { "<bs>", desc = "Decrement Selection", mode = "x" },
  },
  opts = {
    ensure_installed = {
      "python",
      "javascript",
      "lua",
      "luadoc",
      "printf",
      "vim",
      "vimdoc",
      "markdown",
      "bash",
      "html",
      "rust",
      "typescript",
    },
    auto_install = true,
    sync_install = true,
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
}
