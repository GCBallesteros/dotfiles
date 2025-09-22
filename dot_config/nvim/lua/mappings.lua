local map = vim.keymap.set

-- Save & Quit
map("n", ",w", "<CMD>w<CR>", { noremap = true, silent = true, desc = "Save" })
map("n", ",q", "<CMD>q<CR>", { noremap = true, silent = true, desc = "Quit" })

-- Comments
map("n", ",c", "gcc", { desc = "Toggle comment", remap = true })
map("v", ",c", "gc", { desc = "Toggle comment", remap = true })

-- Tabs
map("n", "<leader><tab><tab>", "<CMD>tabNext<CR>", { noremap = true, silent = true, desc = "Next Tab" })
map("n", "<leader><tab>n", "<CMD>tabNext<CR>", { noremap = true, silent = true, desc = "Next Tab" })
map("n", "<leader><tab>p", "<CMD>tabprevious<CR>", { noremap = true, silent = true, desc = "Prevous Tab" })
map("n", "<leader><tab>c", "<CMD>tabclose<CR>", { noremap = true, silent = true, desc = "Close Tab" })

-- Better navigation of quickfix
map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- Diagnostics
map("n", "]d", function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = "Next Diagnostic" })
map("n", "[d", function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = "Next Diagnostic" })

map("n", ",f", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format file" })

-- Terminal
map("t", "<esc>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- map("n", "<leader>bd", require("extra").bufremove, { desc = "Delete Buffer" })

-- Jump to previous <cword>
vim.keymap.set("n", "[[", function()
  local word = vim.fn.expand "<cword>"
  vim.cmd('silent! call search("\\\\<' .. word .. '\\\\>", "b")')
end, { noremap = true, silent = true })

-- Jump to next <cword>
vim.keymap.set("n", "]]", function()
  local word = vim.fn.expand "<cword>"
  vim.cmd('silent! call search("\\\\<' .. word .. '\\\\>", "")')
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>cr", require "renamer", { noremap = true, silent = true, desc = "Rename" })

vim.keymap.set("n", "<leader>cc", function()
  require("nvchad.themes").open { style = "bordered", border = true }
end, { noremap = true, desc = "Theme Picker" })
