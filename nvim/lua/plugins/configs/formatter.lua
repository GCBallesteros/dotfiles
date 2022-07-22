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
