return {
  {
    "lewis6991/gitsigns.nvim",
    -- event = "User FilePost",
    opts = {
      signs = {
        delete = { text = "󰍵" },
        changedelete = { text = "󱕖" },
      },
      on_attach = function(bufnr)
        local gitsigns = require "gitsigns"

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal { "]c", bang = true }
          else
            gitsigns.nav_hunk "next"
          end
        end)

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal { "[c", bang = true }
          else
            gitsigns.nav_hunk "prev"
          end
        end)

        map("n", "<leader>gB", function()
          gitsigns.blame_line { full = true }
        end, { desc = "Blame line" })

        map("n", "<leader>gb", function()
          gitsigns.blame {}
        end, { desc = "Blame" })

        map("n", "<leader>ghi", gitsigns.preview_hunk_inline, { desc = "Preview Hunk Inline" })
      end,
    },
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    keys = {
      { "<leader>gg", "<cmd>tab G<cr>", desc = "Fugitive", mode = { "n", "v" } },
      { "<leader>gc", "<cmd>Gcd<cr>", desc = "CD to repo root", mode = { "n" } },
      { "<leader>gp", "<cmd>G pull<cr>", desc = "Pull" },
    },
  },
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gdd", "<cmd>DiffviewOpen<CR>", desc = "Diff (current)" },
      {
        "<leader>gdv",
        function()
          vim.ui.input({ prompt = "LeftBranch...RightBranch: " }, function(branches)
            if branches ~= nil then
              vim.cmd("DiffviewOpen " .. branches)
            end
          end)
        end,
        desc = "DiffviewOpen",
      },
      { "<leader>gdh", "<CMD>DiffviewFileHistory %<CR>", desc = "Diff file history", mode = { "n" } },
      { "<leader>gdH", "<CMD>DiffviewFileHistory<CR>", desc = "Commits History", mode = { "n" } },
      { "<leader>gdh", "<ESC><CMD>'<,'>DiffviewFileHistory %<CR>", desc = "Diff file history range", mode = { "v" } },
    },
    config = function()
      require("diffview").setup {}
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    opts = { graph_style = "unicode", process_spinner = true, integrations = { diffview = true, snacks = true } },

    keys = {
      { "<leader>GG", "<cmd>Neogit<cr>", desc = "Fugitive", mode = { "n", "v" } },
    },
  },
}
