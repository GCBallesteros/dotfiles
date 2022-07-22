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
  ensure_installed = { "python", "rust", "julia", "lua" },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "c" }, -- list of language that will be disabled
  },
})

-----------------
-- nvim-window --
-----------------
-- stylua: ignore start
local nvim_chars = {
  "j", "k", "l", "u", "i", "o",
  "n", "m", "p", "q", "r", "s",
  "t", "u", "v", "w", "x", "y", "z",
}
-- stylua: ignore end
require("nvim-window").setup({
  normal_hl = "NVIMWINDOW",
  hint_hl = "Bold",
  border = "none",
  chars = nvim_chars,
})

-----------
-- Marks --
-----------
require("marks").setup({
  default_mappings = false,
})

------------
-- Rooter --
------------
g.rooter_manual_only = 1

---------------
-- Iron.nvim --
---------------
iron = require "iron.core"
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

-------------
-- null-ls --
-------------
require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.diagnostics.flake8,
  },
})

--------------
-- Jupytext --
--------------
g.jupytext_fmt = "py:hydrogen"

--------------------
-- Formatter.nvim --
--------------------
local util = require "formatter.util"

-- Provides the Format and FormatWrite commands
require("formatter").setup({
  log_level = vim.log.levels.WARN,
  filetype = {
    python = {
      require("formatter.filetypes.python").black,
    },
    lua = {
      function()
        return {
          exe = "stylua",
          args = {
            "--indent-type Spaces",
            "--indent-width 2",
            "--call-parentheses NoSingleString",
            "-",
          },
          stdin = true,
        }
      end,
    },
    ["*"] = {
      function()
        return { exe = "sed", args = { "-i", "''", "'s/[	 ]*$//'" } }
      end,
    },
  },
})
--vim.api.nvim_create_autocmd("BufWrite", { pattern = "*", command = "Autoformat" })
--g.autoformat_autoindent = 0
--g.autoformat_retab = 0
--g.autoformat_remove_trailing_spaces = 1

--g.formatdef_my_lua = "--indent-type Spaces --indent-width 2 --call-parentheses NoSingleString"
--g.formatters_lua = { "my_lua" }

-------------------
-- Nerdcommenter --
-------------------
g.NERDCreateDefaultMappings = 1
