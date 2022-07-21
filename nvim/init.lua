require "plugins"

require "plugins/configs/startify"
require "plugins/configs/lualine"
require "plugins/configs/cmp"
require "plugins/configs/lsp"
require "plugins/configs/misc"

require "settings/keymap"
require "settings/options"

vim.cmd('source ~/.config/nvim/lua/plugins/configs/wilder.vim')

local g = vim.g
local api = vim.api

------------
-- Python --
------------
local HOME = vim.env.HOME
g.python3_host_prog = HOME .. '/.pyenv/versions/neovim3/bin/python'
g.python_host_prog  = HOME .. '/.pyenv/versions/neovim/bin/python'

-----------------
-- Colorscheme --
-----------------
g.neon_style = "default"
g.neon_italic_keyword = true
g.neon_italic_function = true
g.neon_transparent = false

api.nvim_command('colorscheme neon')

----------
-- Misc --
----------
-- Disable autocommenting
api.nvim_create_autocmd("BufEnter", {command = [[set formatoptions-=cro]]})

-- Hydrogen cell syntax highlight
api.nvim_create_autocmd(
  {"BufEnter", "BufRead", "BufNewFile"},
  { pattern = "*.py", command = [[syn match HYDROGEN /^\s*# %%.*$/]] }
)

-- Toggle relative numbering when into normal mode
local numbertoggle = api.nvim_create_augroup("numbertoggle", { clear = true })
api.nvim_create_autocmd(
  {"BufEnter", "FocusGained", "InsertLeave"},
  { pattern = "*", command = "set relativenumber", group = numbertoggle }
)
api.nvim_create_autocmd(
  {"BufLeave", "FocusLost", "InsertEnter"},
  { pattern = "*", command = "set norelativenumber", group = numbertoggle }
)

-- Yanking from clipboard on windows
--let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
--if executable(s:clip)
    --augroup WSLYank
        --autocmd!
        --autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    --augroup END
--endif



-- Highlights need to be called last to work
require "settings/highlights"

