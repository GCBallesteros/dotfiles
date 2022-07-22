local navic = require "nvim-navic"
local lualine = require "lualine"

lualine.setup({
  options = { theme = "neon" }, -- overriden by the colorscheme selection
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        "diagnostics",
        sources = { "nvim_lsp" },
      },
    },
    lualine_c = {},
    lualine_x = { "encoding", "fileformat", "filetype" },
  },
  tabline = {
    lualine_a = {
      "branch",
      "diff",
    },
    lualine_b = { { "filename", path = 3 } },
    lualine_c = {
      { navic.get_location, cond = navic.is_available },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
