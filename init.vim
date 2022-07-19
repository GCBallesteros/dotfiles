" Install Plug if it's not there yet
let vimplug_exists = expand('~/.local/share/nvim/site/autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif


call plug#begin()
" Better wildmenu
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }

" Colorschemes
Plug 'shaunsingh/moonlight.nvim'
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'Th3Whit3Wolf/space-nvim'
Plug 'folke/tokyonight.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'rafamadriz/neon'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'EdenEast/nightfox.nvim'
Plug 'Pocco81/Catppuccino.nvim'
Plug 'mcchrish/zenbones.nvim'

" Make it easier to jump between windows
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'


" Jump fast!
Plug 'ggandor/lightspeed.nvim'

" Easy line commenting
Plug 'scrooloose/nerdcommenter'

" Session management and pretty splash screen
Plug 'mhinz/vim-startify'

" Command to run black over python files
Plug 'python/black'

" Autoclose pairs
Plug 'jiangmiao/auto-pairs'

" Surround text objects with pairs and edit pairs
Plug 'tpope/vim-surround'

" Show changed lines on gutter
Plug 'airblade/vim-gitgutter'

" Easy git from within neovim
Plug 'tpope/vim-fugitive'

" Fuzzy file/buffer searching
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'tpope/vim-vinegar'

" Better buffer deletion. Just for BD and BD!
Plug 'qpkorr/vim-bufkill'

" LSP and Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'

" Missing stuff
" - inlay hints. This was done with lsp extensions but its deprecated
" - kosayoda/lightbulb for code actions

" Autocompletion
"Plug 'hrsh7th/nvim-compe'

Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'

" Line text object al, il
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'

" All this are to get a Jupyter like experience
Plug 'hkupty/iron.nvim'
Plug 'GCBallesteros/vim-textobj-hydrogen'
Plug 'GCBallesteros/jupytext.vim'

" Saner search and highlightiing behaviour
Plug 'wincent/loupe'

" A floating terminal
Plug 'voldikss/vim-floaterm'

" Autoformatting on save. Just to remove trailing white space
Plug 'Chiel92/vim-autoformat'

" Aesthetics
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Move to root of project. :Rooter
Plug 'airblade/vim-rooter'

" Show marks on gutter
Plug 'chentoast/marks.nvim'
call plug#end()

" ------------------
"  General Settings
" ------------------
set ruler
set colorcolumn=87
set scrolloff=5
syntax enable
set expandtab
set shiftwidth=4
set nowrap
set linebreak
filetype plugin on
set cursorline
set laststatus=2
set termguicolors
set hidden
set scl=auto:2-5

" Search options
set incsearch
set ignorecase
set smartcase

" New leader
let mapleader=","
let maplocalleader = ";"

" Code folding - Start with folds open
set foldlevelstart=99
set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldcolumn=1
set foldnestmax=2

" Completion Options
" Disable scratpad. We just need the floating window
"set completeopt+=preview
set completeopt=menuone,noselect

" Quickfix shortcuts
nnoremap ]q :cn<CR>
nnoremap [q :cp<CR>

" ----------------------------------------
"  Advanced General Settings and mappings
" ----------------------------------------
" The following lines make the cursor work on hybrid mode when in normal mode and
" absolute line number in insert mode.
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Highlight hydrogen cells
au BufRead,BufNewFile *.py syn match HYDROGEN /^\s*# %%.*$/

" Have to install via pip3 neovim and yapf and point python3_host_prog to your python3
let g:python3_host_prog=$HOME .'/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog=$HOME .'/.pyenv/versions/neovim/bin/python'

" Shortcut for faster saving
nnoremap <Leader>w :w<cr>

" Disable bloody autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Copy to clipboard when we are working on WSL2
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" -----------
" Window nav
" -----------
map <silent> <C-w>w :lua require('nvim-window').pick()<CR>

" ----------
"  Terminal
" ----------
" Floating terminal shortcut
nnoremap <silent> <F3> :FloatermToggle<CR>
tnoremap <silent> <F3> <C-\><C-N>:FloatermToggle<CR>

" Escape terminal key with ESC
:tnoremap <Esc> <C-\><C-n>

" -------------
"  Colorscheme
" -------------
"if $TERM == "screen-256color"
    "colorscheme tokyonight
"else
    "" Fallback for terminals supporting less colors.
    "colorscheme dracula
"endif

" -------------------
"  LSP Configuration
" -------------------
" Shortcuts
nnoremap <silent><c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent>gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent>ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><Leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

" Diagnostics shortcuts
nnoremap ]d <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap [d <cmd>lua vim.diagnostic.goto_prev()<CR>

" Configure the actions lightbulb
"autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

" Pretty diagnostics signs
call sign_define('DiagnosticSignError', {'text': '' ,'texthl': 'DiagnosticSignError'})
call sign_define('DiagnosticSignWarn',  {'text': ' ','texthl': 'DiagnosticSignWarn' })
call sign_define('DiagnosticSignInfo',  {'text': '', 'texthl': 'DiagnosticSignInfo' })
call sign_define('DiagnosticSignHint',  {'text': '', 'texthl': 'DiagnosticSignHint' })

" -----------
"  Telescope
" -----------
nnoremap ; <cmd>Telescope buffers<cr>
nnoremap <leader>t <cmd>Telescope git_files<cr>
nnoremap <leader>g0 <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>

" --------
"  Wilder
" --------
call wilder#setup({'modes': [':']})

"call wilder#enable_cmdline_enter()
set wildcharm=<c-n>
cmap <expr> <c-n> wilder#in_context() ? wilder#next() : "\<c-n>"
cmap <expr> <c-p> wilder#in_context() ? wilder#previous() : "\<c-p>"
cmap <expr> <C-D> wilder#can_accept_completion() ? wilder#accept_completion(0) : "\<C-D>"

"call wilder#set_option('pipeline', [
  "\   wilder#branch(
  "\     wilder#cmdline_pipeline({
  "\       'fuzzy': 2,
  "\       'fuzzy_filter': wilder#python_fuzzy_filter(),
  "\       'language': 'python',
  "\       'sorter': wilder#python_difflib_sorter(),
  "\     }),
  "\   ),
  "\ ])

"let s:highlighters = [wilder#pcre2_highlighter()]

call wilder#set_option('renderer', wilder#popupmenu_renderer({
  \ 'highlighter': wilder#basic_highlighter(),
  \ 'left': [
  \   ' ', wilder#popupmenu_devicons(),
  \ ],
  \ 'right': [
  \   ' ', wilder#popupmenu_scrollbar(),
  \ ],
  \ }))

" ----------
"  Startify
" ----------
let g:startify_bookmarks = ['~/.config/nvim/init.vim', '~/.config/nvim/plugins.lua', '~/.zshrc']
let g:startify_relative_path = 1
let g:startify_change_to_vcs_root = 1
let g:startify_use_env = 1
let g:startify_session_persistence = 1
let g:startify_padding_left = 10
let g:startify_files_number = 5
let g:startify_custom_indices = ['a', 's', 'd', 'f', 'j', 'k', 'l', 'g', 'h', 'm', 'v']
let g:my_repos = [
    \ {"line": "TTTR Toolbox","path": '~/Documents/RandomProjects/tttr-toolbox/tttr-toolbox/src/main.rs'},
    \ ]

function! s:list_repos()
    return g:my_repos
  endfunction

let g:startify_lists = [
          \ { 'type': 'files',     'header':              [repeat(' ', g:startify_padding_left).'ﲊ ']  },
          \ { 'type': 'sessions',  'header':              [repeat(' ', g:startify_padding_left).'  '] },
          \ { 'type': 'bookmarks', 'header':              [repeat(' ', g:startify_padding_left).' '], 'indices': ['A', 'S', 'D'] },
          \ { 'type': function('s:list_repos'), 'header': [repeat(' ', g:startify_padding_left).' ']  },
          \ ]

let g:custom_header = [
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣰⣶⣿⣿⣿⡄⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⢠⣿⣿⣿⣶⣆⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣷⣼⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣧⣾⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀',
\ '⠀⠀⠀⠙⠻⣶⣤⣄⣀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⣀⣠⣤⣶⠟⠋⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣷⣷⣤⣨⡘⣿⣶⣶⣤⣠⣿⡿⠙⣿⣿⣿⣿⣿⣿⣿⣶⣶⣦⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣴⣶⣶⣿⣿⣿⣿⣿⣿⣿⠋⢿⣿⣄⣤⣶⣶⣿⢃⣅⣤⣾⣾⣿⣿⠟⠉⠀⠀⠀⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢻⢿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀███╗   ██╗██╗   ██╗██╗███╗   ███╗ ⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⡿⡟⠉⠀⠀⠀⠀⠀⠀⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣿⣿⣿⡀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀████╗  ██║██║   ██║██║████╗ ████║ ⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⢂⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⢀⣿⣿⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⡿⣟⣵⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀██╔██╗ ██║██║   ██║██║██╔████╔██║  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣮⣻⢿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⠟⢹⣿⣿⣿⣿⣿⣿⣿⣿⡿⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⢿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠻⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡿⢿⣯⡀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣽⣿⣿⣿⣿⣿⣿⣿⣾⣧⢀⣽⡿⢿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⡇⠠⣀⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣀⠄⢸⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡿⣱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣴⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀         ⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣦⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣎⢿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠔⢉⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀         ⠀ ⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⡉⠢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀         ⠀ ⠀⠀⠀⠀⠀⠀⢴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀         ⠀ ⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⡿⡿⠿⠛⠛⠉⠁⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀           ⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠈⠉⠛⠛⠿⢿⢿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
\ ]
let g:startify_custom_header ='startify#center(g:custom_header)'

" -----------------------
"  Other Plugin settings
" -----------------------
" Autoformat everything
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1

" Jupytext
let g:jupytext_fmt = 'py:hydrogen'

" Unset the "last search pattern" register by hitting return
nmap <CR> <Plug>(LoupeClearHighlight)

" Send cell to IronRepl and move to next one.
" Depends on the text object defined in vim-textobj-hydrogen
" You first need to be connected to IronRepl
nmap ]x ctrih]h<CR><CR>

let g:rooter_manual_only = 1

" ------------
"  Lua config
" ------------
luafile $HOME/.config/nvim/plugins.lua
