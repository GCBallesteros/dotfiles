-- Colorscheme
vim.g.neon_style = "default"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
vim.g.neon_transparent = false

vim.cmd[[colorscheme neon]]

-- Statusline
require'lualine'.setup{
    options = { theme = 'neon' },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {
                'diagnostics',
                sources = {'nvim_lsp'}
            }
        },
        lualine_c = {},
        lualine_x = {'encoding', 'fileformat', 'filetype'}
    },
    tabline = {
      lualine_a = {},
      lualine_b = {'branch', 'diff'},
      lualine_c = {{'filename', path=3}},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    }
}

-- Faster window selection
vim.api.nvim_set_hl(0, 'NVIMWINDOW', { fg = "#000000", bg = "#f2de91" })
require('nvim-window').setup({
  normal_hl = 'NVIMWINDOW',
  hint_hl = 'Bold',
  border = 'none',
   -- The characters available for hinting windows.
  chars = {
    'j', 'k', 'l', 'u', 'i', 'o', 'n', 'm',
    'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
  },

})

-- Python LSP Configuration
require'lspconfig'.pyright.setup{
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off"
            }
        }
    }
}

-- Rust LSP Configuration
require'lspconfig'.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    },
})

require "lsp_signature".setup()

-- Treesitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "rust", "julia"},     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,       -- false will disable the whole extension
    disable = { "c", },  -- list of language that will be disabled
  },
}

-- Iron.nvim
iron = require("iron.core")
iron.setup {
    config = {
        should_map_plug = false,
        scratch_repl = true,
        repl_definition = {
            python = {
                command = {"ipython"},
                format = require("iron.fts.common").bracketed_paste
            }
        }
    },
    keymaps = {
        send_motion = "ctr",
        visual_send = "ctr",
    }
}

-- Autocompletion engine
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}
