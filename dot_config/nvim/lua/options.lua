local o = vim.o

o.cursorlineopt = "both"
o.relativenumber = true
o.scrolloff = 5
o.colorcolumn = "87"

o.number = true
o.mouse = "a"
o.breakindent = true

o.undofile = true

o.ignorecase = true
o.smartcase = true
o.smartindent = true
o.termguicolors = true
o.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
o.wrap = false -- Disable line wrap

-- Keep signcolumn on by default
o.signcolumn = "yes"

-- Decrease update time
o.updatetime = 250

-- Decrease mapped sequence wait time
o.timeoutlen = 300

o.splitright = true
o.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.cursorline = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

o.cmdheight = 0
o.clipboard = "unnamedplus" -- Sync with system clipboard

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldtext = ""
vim.o.foldcolumn = "0"
-- vim.o.fillchars:append { fold = " " }
-- single status line
vim.o.laststatus = 3
