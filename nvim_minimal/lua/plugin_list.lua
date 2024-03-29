return {
  plugins = {
    "wbthomason/packer.nvim", -- packer manages itself
    "nvim-lua/plenary.nvim", -- avoids callbacks, used by other plugins
    "nvim-lua/popup.nvim", -- popup for other plugins
    "nvim-treesitter/nvim-treesitter", -- language parsing completion engine
    "neovim/nvim-lspconfig", -- language server protocol implementation
    "williamboman/mason.nvim", -- lsp, dap, linter management
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
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
    "ggandor/lightspeed.nvim", -- Move at the speed of light!
    "scrooloose/nerdcommenter", -- Easy commenting
    "kana/vim-textobj-user", -- More text objects
    "kana/vim-textobj-line", -- al, il textobjects for lines
    "nvim-lualine/lualine.nvim", -- Status line
    "kyazdani42/nvim-web-devicons", -- icons
    "ryanoasis/vim-devicons", -- more icons!
    "https://gitlab.com/yorickpeterse/nvim-window.git", -- window jumping
    "airblade/vim-gitgutter", -- show git status on gutter
    "jiangmiao/auto-pairs", -- autopairs
    "qpkorr/vim-bufkill", -- for BD and BD!
    "wincent/loupe", -- saner highlighting and search
    "hkupty/iron.nvim", -- REPL for ipython
    "GCBallesteros/vim-textobj-hydrogen", -- Jump cells of hydrogen
    "GCBallesteros/jupytext.vim", -- Open jupyter notebooks
    "jose-elias-alvarez/null-ls.nvim", -- For extra linting
    "gelguy/wilder.nvim", -- Wild menu!
    "norcalli/nvim-colorizer.lua", -- Highlight colors
    "stevearc/dressing.nvim", -- better ui
    "rcarriga/nvim-notify", -- fancy notifications
    -- Colorschemes
    "rafamadriz/neon",
    "folke/tokyonight.nvim",
    { "catppuccin/nvim", as = "catppuccin" },
    "marko-cerovac/material.nvim",
    "freitass/todo.txt-vim",
  },
}
