return {
  {
    "nvim-mini/mini.pick",
    dependencies = { "nvim-mini/mini.extra" },
    version = false,
    config = function()
      require("mini.pick").setup {
        mappings = {
          move_down = "<C-n>",
          move_up = "<C-p>",
        },
      }
    end,

    keys = {
      {
        ";",
        function()
          require("mini.pick").builtin.buffers()
        end,
        desc = "Pick buffers",
      },
      {
        "<leader>/",
        function()
          require("mini.pick").builtin.grep_live()
        end,
        desc = "Live grep",
      },
      {
        "<leader>f",
        function()
          require("mini.pick").builtin.files()
        end,
        desc = "Search files",
      },
      {
        "<leader>ss",
        function()
          require("mini.extra").pickers.lsp { scope = "document_symbol" }
        end,
        desc = "Document Symbol",
      },
      {
        "<leader>sS",
        function()
          require("mini.extra").pickers.lsp { scope = "workspace_symbol" }
        end,
        desc = "Workspace Symbol",
      },
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      -- {
      --   "<leader>-",
      --   function()
      --     Snacks.explorer()
      --   end,
      --   desc = "Explorer",
      -- },
      -- {
      --   ";",
      --   function()
      --     Snacks.picker.buffers()
      --   end,
      --   desc = "Buffers",
      -- },
      -- {
      --   "<leader>t",
      --   function()
      --     Snacks.picker.git_files()
      --   end,
      --   desc = "Find Git Files",
      -- },
      -- {
      --   "<leader>ss",
      --   function()
      --     Snacks.picker.lsp_symbols()
      --   end,
      --   desc = "Buffer Symbols",
      -- },
      -- {
      --   "<leader>sS",
      --   function()
      --     Snacks.picker.lsp_workspace_symbols()
      --   end,
      --   desc = "Workspace Symbols",
      -- },
      -- {
      --   "<leader>/",
      --   function()
      --     Snacks.picker.grep {
      --       exclude = { "*.lock", "__pycache__/**" },
      --     }
      --   end,
      --   desc = "Grep",
      -- },
      -- {
      --   "<leader>g/",
      --   function()
      --     local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      --     if vim.v.shell_error ~= 0 or not git_root or git_root == "" then
      --       git_root = vim.loop.cwd() -- fallback to current dir if not a git repo
      --     end
      --     Snacks.picker.grep {
      --       dirs = { git_root },
      --       exclude = { "*.lock", "__pycache__/**" },
      --     }
      --   end,
      --   desc = "Grep (Git Root)",
      -- },
    },
    opts = {
      picker = { main = { file = false, current = true } },
      statuscolumn = {},
      explorer = {},
    },
  },
}
