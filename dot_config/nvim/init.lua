
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.opt.termguicolors = true
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

-- Setup lazy.nvim
require("lazy").setup {
  spec = {
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}

vim.api.nvim_command "colorscheme nvchad"

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "syntax")
dofile(vim.g.base46_cache .. "treesitter")
dofile(vim.g.base46_cache .. "blink")
dofile(vim.g.base46_cache .. "whichkey")
dofile(vim.g.base46_cache .. "colors")
dofile(vim.g.base46_cache .. "leap")
dofile(vim.g.base46_cache .. "neogit")
dofile(vim.g.base46_cache .. "diffview")

require "mappings"
require "options"


require "autocmds"
