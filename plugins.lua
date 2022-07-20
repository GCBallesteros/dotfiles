-- Colorscheme
vim.g.neon_style = "default"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
vim.g.neon_transparent = false

vim.cmd[[colorscheme neon]]

-- Marks
require'marks'.setup {
    default_mappings=false
}

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

-- highlight hydrogen cells
vim.api.nvim_set_hl(0, 'HYDROGEN', {fg = "#000000", bg="#CCCCCC"})

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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require'lspconfig'.pyright.setup{
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
            },
        }
    },
    capabilities=capabilities,
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
            checkOnSave = {
                command = "clippy"
            },
        }
    },
    capabilities=capabilities,
})

-- Treesitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "rust", "julia", "lua"},
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

-- nvim-cmp
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch",      {fg="#569cd6",  ctermfg=74,  })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", {fg="#569cd6",  ctermfg=74,  })

vim.api.nvim_set_hl(0, "CmpItemKindVariable",   {fg="#9cdcfe",  ctermfg=158, })
vim.api.nvim_set_hl(0, "CmpItemKindInterface",  {fg="#9cdcfe",  ctermfg=134, })
vim.api.nvim_set_hl(0, "CmpItemKindText",       {fg="#9cdcfe",  ctermfg=187, })

vim.api.nvim_set_hl(0, "CmpItemKindFunction",   {fg="#c586c0",  ctermfg=38,  })
vim.api.nvim_set_hl(0, "CmpItemKindMethod",     {fg="#c586c0",  ctermfg=39,  })

vim.api.nvim_set_hl(0, "CmpItemKindKeyword",    {fg="#d4d4d4",  ctermfg=38,  })
vim.api.nvim_set_hl(0, "CmpItemKindProperty",   {fg="#d4d4d4",  ctermfg=38,  })
vim.api.nvim_set_hl(0, "CmpItemKindUnit",       {fg="#d4d4d4",  ctermfg=38,  })

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property ="",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'nvim_lsp_signature_help' },
  },
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[TXT]",
        nvim_lsp = "[LSP]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end
  },
})
