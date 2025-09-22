return {
  {
    "ggandor/leap.nvim",
    dependencies = { "ggandor/leap-ast.nvim" },
    enabled = true,
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "L", mode = { "n", "x", "o" }, desc = "Treesitter jump" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.set({ "n", "x", "o" }, "L", function()
        require("leap-ast").leap()
      end, {})
      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "n", "x", "o" }, "gs")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  {
    "ggandor/flit.nvim",
    enabled = true,
    keys = function()
      local ret = {}
      for _, key in ipairs { "f", "F", "t", "T" } do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
}
