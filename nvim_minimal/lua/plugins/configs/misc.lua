local g = vim.g

---------------
-- Telescope --
---------------
require("telescope").setup({
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})
require("telescope").load_extension "fzy_native"

----------------
-- Treesitter --
----------------
require("nvim-treesitter.configs").setup({
  ensure_installed = { "python", "rust", "julia", "lua", "c", "norg" },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {}, -- list of language that will be disabled
  },
})

---------------
-- Iron.nvim --
---------------
local iron = require "iron.core"
iron.setup({
  config = {
    should_map_plug = false,
    scratch_repl = true,
    repl_definition = {
      python = {
        command = { "ipython" },
        format = require("iron.fts.common").bracketed_paste,
      },
    },
  },
  keymaps = {
    send_motion = "ctr",
    visual_send = "ctr",
  },
})

-------------------
-- Nerdcommenter --
-------------------
g.NERDCreateDefaultMappings = 1

--------------------
-- nvim-colorizer --
--------------------
-- colorizers needs termguicolors to load correctly
vim.opt.termguicolors = true
require("colorizer").setup({
  "css",
  "javascript",
  "html",
  "python",
  "lua",
})

-----------
-- Navic --
-----------
-- VSCode Symbols
require("nvim-navic").setup({
  icons = {
    File = " ",
    Module = " ",
    Namespace = " ",
    Package = " ",
    Class = "ﴯ ",
    Method = " ",
    Property = " ",
    Field = " ",
    Constructor = " ",
    Enum = " ",
    Interface = " ",
    Function = " ",
    Variable = " ",
    Constant = " ",
    String = "ﮜ ",
    Number = " ",
    Array = " ",
    Boolean = " ",
    Object = " ",
    Key = " ",
    Null = "ﳠ ",
    EnumMember = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
  },
})

--------------
-- dressing --
--------------
require("dressing").setup({})

-----------------
-- notify-nvim --
-----------------
local notify = require "notify"
notify.setup({})
vim.notify = notify
