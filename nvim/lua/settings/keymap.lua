local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","
vim.g.maplocalleader = ";"

-- Modes:
--   Normal       = "n"
--   Insert       = "i"
--   Visual       = "v"
--   Visual_Block = "x"
--   Terminal     = "t"
--   Command      = "c"

---------------
-- Telescope --
---------------
keymap("n", ";", "<CMD>Telescope buffers<CR>", opts)
keymap("n", "<leader>t", "<CMD>Telescope git_files<CR>", opts)
keymap("n", "<leader>g0", "<CMD>Telescope lsp_document_symbols<CR>", opts)
keymap("n", "<leader>g", "<CMD>Telescope live_grep<CR>", opts)

--------------
-- Terminal --
--------------
-- Floating terminal shortcuts
keymap("n", "<F3>", "<CMD>FloatermToggle<CR>", opts)
keymap("t", "<F3>", "<F3> <C-\\><C-N><CMD>FloatermToggle<CR>", opts)

-- Escape terminal key with ESC
keymap("t", "<ESC>", "<C-\\><C-n>", opts)

---------
-- LSP --
---------
keymap("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

-----------------
-- nvim-window --
-----------------
keymap("n", "<C-w>w", "<cmd>lua require('nvim-window').pick()<CR>", opts)

----------
-- Iron --
----------
keymap("n", "]x", "ctrih]h<CR><CR>", { noremap = false, silent = true })

-------------------
-- Nerdcommenter --
-------------------
keymap("v", "<leader>c<space> ", "<cmd>NERDCommenterToggle<CR>", opts)
keymap("n", "<leader>c<space> ", "<cmd>NERDCommenterToggle<CR>", opts)

-------------
-- null-ls --
-------------
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)

----------
-- Misc --
----------
-- fast saving
keymap("n", "<leader>w", "<CMD>w<CR>", opts)
-- clear highlighting
keymap("n", "<CR>", "<Plug>(LoupeClearHighlight)", { noremap = false, silent = true })
--quickfix movement
keymap("n", "]q", "<cmd>cn<CR>", opts)
keymap("n", "[q", "<cmd>cp<CR>", opts)
