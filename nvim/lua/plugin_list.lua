return {
  plugins = {
    "wbthomason/packer.nvim", -- packer manages itself
    "nvim-lua/plenary.nvim", -- avoids callbacks, used by other plugins
    "nvim-lua/popup.nvim", -- popup for other plugins
    "nvim-treesitter/nvim-treesitter", -- language parsing completion engine
    "neovim/nvim-lspconfig", -- language server protocol implementation
    "hrsh7th/nvim-cmp", -- THE vim completion engine
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "SmiteshP/nvim-navic", -- location in file using lsp
    "nvim-telescope/telescope.nvim", -- finder, requires fzf and ripgrep
    "nvim-telescope/telescope-fzy-native.nvim",
    "voldikss/vim-floaterm", -- Simple floatterm
    "tpope/vim-vinegar", -- Netrw enhancements
    "mhinz/vim-startify", -- Spalsh screen
    "ggandor/lightspeed.nvim", -- Move at the speed of light!
    "scrooloose/nerdcommenter", -- Easy commenting
    "tpope/vim-fugitive", -- A Git wrapper so awesome, it should be illegal
    "kana/vim-textobj-user", -- More text objects
    "kana/vim-textobj-line", -- al, il textobjects for lines
    "nvim-lualine/lualine.nvim", -- Status line
    "kyazdani42/nvim-web-devicons", -- icons
    "ryanoasis/vim-devicons", -- more icons!
    "https://gitlab.com/yorickpeterse/nvim-window.git", -- window jumping
    "tpope/vim-surround", -- easy surrounding in pairs
    "airblade/vim-gitgutter", -- show git status on gutter
    "jiangmiao/auto-pairs", -- autopairs
    "qpkorr/vim-bufkill", -- for BD and BD!
    "wincent/loupe", -- saner highlighting and search
    "chentoast/marks.nvim", -- show marks on gutter
    "airblade/vim-rooter", -- Jump to root with Rooter
    "hkupty/iron.nvim", -- REPL for ipython
    "GCBallesteros/vim-textobj-hydrogen", -- Jump cells of hydrogen
    "GCBallesteros/jupytext.vim", -- Open jupyter notebooks
    "jose-elias-alvarez/null-ls.nvim", -- For extra linting
    "gelguy/wilder.nvim", -- Wild menu!
    -- Colorschemes
    "rafamadriz/neon",
    "folke/tokyonight.nvim",
    { "catppuccin/nvim", as = "catppuccin" },
    "marko-cerovac/material.nvim",
  },
}
