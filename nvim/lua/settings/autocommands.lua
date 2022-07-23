local api = vim.api

-- Disable autocommenting
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Hydrogen cell syntax highlight
api.nvim_create_autocmd(
  { "BufEnter", "BufRead", "BufNewFile" },
  { pattern = "*.py", command = [[syn match HYDROGEN /^\s*# %%.*$/]] }
)

-- Toggle relative numbering when into normal mode
local numbertoggle = api.nvim_create_augroup("numbertoggle", { clear = true })
api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave" },
  { pattern = "*", command = "set relativenumber", group = numbertoggle }
)
api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter" },
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

-- Autocommand to reload neovim when you save this file
vim.cmd [[
   augroup packer_user_config
      autocmd!
      autocmd BufWritePost */lua/plugin_list.lua source <afile> | PackerSync
   augroup end
]]
