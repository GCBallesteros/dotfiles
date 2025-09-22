local options = {

  base46 = {
    theme = "embark", -- default theme
    hl_add = {},
    hl_override = {},
    integrations = { "leap", "neogit", "blink", "diffview", "markview", "treesitter", "syntax" },
    changed_themes = {},
    transparency = false,
    theme_toggle = { "onedark", "embark" },
  },

  ui = {
    statusline = {
      enabled = false,
    },

    -- lazyload it when there are 1+ buffers
    tabufline = {
      enabled = false,
    },
  },

  term = {
    base46_colors = true,
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },

  lsp = { signature = false },

  cheatsheet = {
    theme = "grid", -- simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
  },

  colorify = {
    enabled = true,
    mode = "virtual", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },
}

return options
