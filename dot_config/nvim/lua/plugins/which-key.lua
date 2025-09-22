return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    require("which-key").setup(opts)
    local present, wk = pcall(require, "which-key")
    if not present then
      return
    end
    wk.add {
      { "<leader><tab>", group = "tabs" },
      { "<leader>f", group = "file" },
      { "<leader>g", group = "git" },
      { "<leader>m", group = "misc", icon = "" },
      { "<leader>x", group = "trouble", icon = "" },
      { "<leader>c", group = "code" },
      { "<leader>h", group = "git signs" },
    }
  end,
}
