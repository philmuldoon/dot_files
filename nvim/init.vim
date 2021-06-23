" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

call plug#begin(stdpath('data') . '/plugged')
  " Ruby stuff
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-endwise'
  Plug 'dense-analysis/ale'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'tpope/vim-bundler'

  " Editor Configi
  Plug 'sgur/vim-editorconfig'

  " Help to navigate
  Plug 'liuchengxu/vim-which-key'
  Plug 'sudormrfbin/cheatsheet.nvim'

  " Theme
  Plug 'morhetz/gruvbox'
  Plug 'kyazdani42/nvim-web-devicons'

  " Status line
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Use Treesitter to build source and enable some utilities.
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'lewis6991/spellsitter.nvim'
  Plug 'nvim-treesitter/nvim-treesitter-refactor' " this provides "go to def" etc

  " General utilities and libs
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'

  " Telescope and utilities
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim', { 'do': 'make' }

  " LSP
  Plug 'nvim-lua/lsp-status.nvim'
  Plug 'RishabhRD/nvim-lsputils'
  Plug 'RishabhRD/popfix'
  Plug 'neovim/nvim-lspconfig'

  " Completion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/deoplete-lsp'
  Plug 'deoplete-plugins/deoplete-tag'

  " NERDtree
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  " Search
  Plug 'jremmen/vim-ripgrep'

  Plug 'psliwka/vim-smoothie'
  Plug 'ap/vim-buftabline'
  Plug 'mhinz/vim-startify'
call plug#end()

"Mode Settings
set guicursor=n-v-c:block-blinkon0,i-ci-ve:block-blinkwait100-blinkoff50-blinkon50,r-cr:hor20,o:hor50

let g:deoplete#enable_at_startup = 1
let g:deoplete#lsp#use_icons_for_candidates = 1
" Set some defaults.
set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

let g:indent_guides_enable_on_vim_startup = 1

set hidden
set cursorline
set backspace=indent,eol,start
set modeline
set splitright
set number

" Theme
set t_Co=256 "256 colours
set background=dark
set termguicolors
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_improved_strings=1
let g:gruvbox_improved_warnings=1
colorscheme gruvbox

" set airline theme
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts=1

" Search
set smartcase
set hlsearch
set incsearch
set wildmenu
set wildmode=longest,list,full

" Layout and tabs
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=2
set autoread

" Open file at same line as when closed
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

" Define leader
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" Setup whichkey
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Buffer shortcuts
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Ale configury
let g:ale_linters = {
      \   'ruby': ['rubocop', 'rails_best_practivces', 'ruby'],
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['eslint'],
      \}
let g:ale_fixers = {
      \    'ruby': ['remove_trailing_lines', 'rubocop', 'trim_whitespace'],
      \}
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_auto_correct_all = 1
let g:ale_lint_delay = 1000

" Telescope shortcuts
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>? <cmd>Cheatsheet<cr>

nnoremap <leader>Cp <cmd>Telescope loclist<cr>
nnoremap <leader>Cs <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>Ct <cmd>Telescope current_buffer_tags<cr>
nnoremap <leader>Clt <cmd>Telescope tag_stack<cr>
nnoremap <leader>Cf <cmd>Telescope file_browser<cr>
"
" Configure the completion chains
let g:completion_chain_complete_list = {
			\'default' : {
			\	'default' : [
			\		{'complete_items' : ['ts', 'lsp', 'snippet']},
			\		{'mode' : 'file'}
			\	],
			\	'comment' : [],
			\	'string' : []
			\	},
			\'vim' : [
			\	{'complete_items': ['snippet']},
			\	{'mode' : 'cmd'}
			\	],
			\'c' : [
			\	{'complete_items': ['ts']}
			\	],
			\'python' : [
			\	{'complete_items': ['ts']}
			\	],
			\'lua' : [
			\	{'complete_items': ['ts']}
			\	],
            \'ruby': [
            \    {'complete_items': ['ts', 'tags', 'lsp']}
            \   ],
			\}

" Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()
autocmd BufRead,BufNewFile *.md setlocal spell
set spelllang=en_gb
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
nnoremap <silent> <F4> :set spell!<cr>
inoremap <silent> <F4> <C-O>:set spell!<cr>


nnoremap <silent> <leader>Dd <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> <leader>De <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent> <leader>Hh <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> <leader>Di <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> <leader>Sh <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <silent> <leader>Wa <cmd>lua vim.lsp.buf.add_workspace_folder()<cr>
nnoremap <silent> <leader>Wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>
nnoremap <silent> <leader>Wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>
nnoremap <silent> <leader>Dt <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> <leader>Dr <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <silent> <leader>Ca <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <silent> <leader>Dt <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <silent> <leader>Dl <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
nnoremap <silent> <leader>Dgp <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> <leader>Dgn <cmd>lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <silent> <leader>Ds <cmd>lua vim.lsp.diagnostic.set_loclist()<cr>
nnoremap <silent> <leader>Fo <cmd>lua vim.lsp.buf.formatting()<cr>


" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local key bindings when the language server attaches
local servers = { "solargraph", "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

require'nvim-web-devicons'.setup {
 -- your personal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overridden by `get_icons` option
 default = true;
}

require('spellsitter').setup()
require'nvim-treesitter.configs'.setup{
  ensure_installed = {"ruby", "javascript", "python", "json", "css", "typescript"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true
  },
  textobjects = {
    enable = true
  },
}


require('telescope').setup {
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  }
}
require('telescope').load_extension('fzy_native')
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
set signcolumn=number

