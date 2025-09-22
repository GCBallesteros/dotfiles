local function all_buffer_object()
  local from = { line = 1, col = 1 }
  local to = {
    line = vim.fn.line "$",
    col = math.max(vim.fn.getline("$"):len(), 1),
  }
  return { from = from, to = to }
end

local function inactive_content()
  local MiniStatusline = require "mini.statusline"
  local filename = MiniStatusline.section_filename { trunc_width = 140 }

  return MiniStatusline.combine_groups {
    "%<", -- Mark general truncate point
    { hl = "MiniStatuslineFilename", strings = { filename } },
    "%=", -- End left alignment
  }
end

local function active_content()
  local MiniStatusline = require "mini.statusline"

  local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
  local git = MiniStatusline.section_git { trunc_width = 40 }
  local diff = MiniStatusline.section_diff { trunc_width = 75 }
  local filename = MiniStatusline.section_filename { trunc_width = 140 }
  local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
  local location = MiniStatusline.section_location { trunc_width = 75 }
  local search = MiniStatusline.section_searchcount { trunc_width = 75 }

  -- Prep diagnostics
  local diagnostics_str = MiniStatusline.section_diagnostics { trunc_width = 75 }
  local diagnostics_tbl = {}

  for _, component in ipairs(vim.split(diagnostics_str, " ")) do
    local key, count = component:match "(%a)(%d+)"
    if key and count then
      diagnostics_tbl[key] = tonumber(count)
    end
  end

  -- Build all the sections
  local sections = {
    { hl = mode_hl, strings = { mode } },
    { hl = "MiniStatuslineDevinfo", strings = { git, diff } },
  }

  -- Provide highlighted strings for each diagnostic type
  if diagnostics_tbl["E"] then
    table.insert(
      sections,
      { hl = "MiniStatuslineDiagnosticError", strings = { string.format(" %d", diagnostics_tbl["E"]) } }
    )
  end
  if diagnostics_tbl["W"] then
    table.insert(
      sections,
      { hl = "MiniStatuslineDiagnosticWarn", strings = { string.format(" %d", diagnostics_tbl["W"]) } }
    )
  end
  if diagnostics_tbl["I"] then
    table.insert(
      sections,
      { hl = "MiniStatuslineDiagnosticInfo", strings = { string.format(" %d", diagnostics_tbl["I"]) } }
    )
  end
  if diagnostics_tbl["H"] then
    table.insert(
      sections,
      { hl = "MiniStatuslineDiagnosticHint", strings = { string.format("󰍉 %d", diagnostics_tbl["H"]) } }
    )
  end

  -- Continue with other sections
  -- table.insert(sections, { hl = "MiniStatuslineDevinfo", strings = { lsp } })
  table.insert(sections, "%<")
  table.insert(sections, { hl = "MiniStatuslineFilename", strings = { filename } })
  table.insert(sections, "%=")
  table.insert(sections, { hl = "MiniStatuslineFileinfo", strings = { fileinfo } })
  table.insert(sections, { hl = mode_hl, strings = { search, location } })

  return MiniStatusline.combine_groups(sections)
end

-- Custom highlight setup
vim.api.nvim_set_hl(0, "MiniStatuslineDiagnosticError", { link = "TodoBgFIX" })
vim.api.nvim_set_hl(0, "MiniStatuslineDiagnosticWarn", { link = "TodoBgWARN" })
vim.api.nvim_set_hl(0, "MiniStatuslineDiagnosticInfo", { link = "TodoBgPERF" })
vim.api.nvim_set_hl(0, "MiniStatuslineDiagnosticHint", { link = "TodoBgNOTE" })

return {
  {
    "echasnovski/mini.statusline",
    version = false,
    opts = {
      use_icons = true,
      content = { inactive = inactive_content, active = active_content },
    },
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    version = false,
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },

    opts = function(_, opts)
      local ai = require "mini.ai"
      local extra_objects = {
        g = all_buffer_object,
        f = ai.gen_spec.treesitter { a = "@function.outer", i = "@function.inner" },
        a = ai.gen_spec.treesitter { a = "@parameter.outer", i = "@parameter.inner" },
        c = ai.gen_spec.treesitter { a = "@class.outer", i = "@class.inner" },
      }

      -- Make sure we have a place to put the custom_textobjects
      if opts.custom_textobjects == nil then
        opts.custom_textobjects = {}
      end

      for k, v in pairs(extra_objects) do
        opts.custom_textobjects[k] = v
      end

      opts.n_lines = 200

      return opts
    end,
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    version = false,
    opts = {
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "", -- Find surrounding (to the right)
        find_left = "", -- Find surrounding (to the left)
        highlight = "", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "", -- Update `n_lines`
      },
    },
  },
  { "echasnovski/mini.indentscope", version = "*", opts = { draw = { delay = 250 } } },
}
