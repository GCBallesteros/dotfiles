local fn = vim.fn
-- Automatically install packer on initial startup
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
   Packer_Bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
   print "---------------------------------------------------------"
   print "Press Enter to install packer and plugins."
   print "After install -- close and reopen Neovim to load configs!"
   print "---------------------------------------------------------"
   vim.cmd [[packadd packer.nvim]]
end

-- Autocommand to reload neovim when you save this file
vim.cmd [[
   augroup packer_user_config
      autocmd!
      autocmd BufWritePost ~/.config/nvim/lua/plugins/init.lua source <afile> | PackerSync
   augroup end
]]

-- Use a protected call
local present, packer = pcall(require, "packer")

if not present then
   return
end

packer.startup(function(use)
   use 'wbthomason/packer.nvim'           -- packer manages itself
   use 'nvim-lua/plenary.nvim'            -- avoids callbacks, used by other plugins
   use 'nvim-lua/popup.nvim'              -- popup for other plugins
   use 'nvim-treesitter/nvim-treesitter'  -- language parsing completion engine
   use 'neovim/nvim-lspconfig'            -- language server protocol implementation
   use 'hrsh7th/nvim-cmp'                 -- THE vim completion engine
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/cmp-nvim-lsp-signature-help'
   use 'nvim-telescope/telescope.nvim'    -- finder, requires fzf and ripgrep
   use 'nvim-telescope/telescope-fzy-native.nvim'
   use 'voldikss/vim-floaterm'            -- Simple floatterm
   use 'tpope/vim-vinegar'                -- Netrw enhancements
   use 'mhinz/vim-startify'               -- Spalsh screen
   use 'ggandor/lightspeed.nvim'          -- Move at the speed of light!
   use 'scrooloose/nerdcommenter'         -- Easy commenting
   use 'tpope/vim-fugitive'               -- A Git wrapper so awesome, it should be illegal
   use 'kana/vim-textobj-user'            -- More text objects
   use 'kana/vim-textobj-line'            -- al, il textobjects for lines
   use 'nvim-lualine/lualine.nvim'        -- Status line
   use 'kyazdani42/nvim-web-devicons'     -- icons
   use 'ryanoasis/vim-devicons'           -- more icons!
   use 'https://gitlab.com/yorickpeterse/nvim-window.git' -- window jumping
   use 'tpope/vim-surround'               -- easy surrounding in pairs
   use 'airblade/vim-gitgutter'           -- show git status on gutter
   use 'jiangmiao/auto-pairs'             -- autopairs
   use 'qpkorr/vim-bufkill'               -- for BD and BD!
   use 'wincent/loupe'                    -- saner highlighting and search
   use 'chentoast/marks.nvim'             -- show marks on gutter
   use 'airblade/vim-rooter'              -- Jump to root with Rooter
   use 'hkupty/iron.nvim'                 -- REPL for ipython
   use 'GCBallesteros/vim-textobj-hydrogen' -- Jump cells of hydrogen
   use 'GCBallesteros/jupytext.vim'       -- Open jupyter notebooks
   use 'jose-elias-alvarez/null-ls.nvim'  -- For extra linting
   use 'python/black'                     -- Black formatter
   use 'Chiel92/vim-autoformat'           -- Autoformatting
   use 'gelguy/wilder.nvim'               -- Wild menu!
   -- Colorschemes
   use 'rafamadriz/neon'
   use 'folke/tokyonight.nvim'
   use { "catppuccin/nvim", as = "catppuccin" }

  if Packer_Bootstrap then
    require('packer').sync()
  end
end)
