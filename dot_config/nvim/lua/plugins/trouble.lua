return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=true auto_refresh=true<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>xq",
      "<cmd>Trouble close<cr>",
      desc = "Trouble Close",
    },
    {
      "gr",
      "<cmd>Trouble lsp_references<cr>",
      desc = "LSP References",
    },
    {
      "gR",
      "<cmd>Trouble lsp_references filter.buf=0<cr>",
      desc = "LSP References",
    },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").prev { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Previous Trouble/Quickfix Item",
    },
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Next Trouble/Quickfix Item",
    },
  },
  config = function()
    require("trouble").setup {
      follow = false,
      auto_refresh = false,

      modes = {
        lsp_references = {
          params = {
            include_declaration = true,
          },
        },
        lsp_base = {
          params = {
            include_current = true,
          },
        },
      },
    }
  end,
}
