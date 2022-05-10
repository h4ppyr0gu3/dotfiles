" General settings
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
set relativenumber
set colorcolumn=0
syntax enable

set path+=**
set wildmenu

command! MakeTags !ctags\ -R\ .
set tags=./tags,tags;$HOME

set splitright
set splitbelow
set scrolloff=6

" Command Remapping
" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <CR> :a<CR><CR>.<CR>
" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr> 
" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

" vim-plug plugins

call plug#begin()
  " Themes
  Plug 'jacoborus/tender.vim'
  " Aesthetic improvements
  Plug 'mhinz/vim-startify'
  Plug 'vim-airline/vim-airline'
  Plug 'preservim/nerdtree'
  Plug 'slim-template/vim-slim'
  Plug 'preservim/nerdcommenter'
  Plug 'preservim/tagbar'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'duane9/nvim-rg'
  " Commands
  Plug 'Konfekt/vim-alias'
  " Syntax Highlighting Language Dependant  
  Plug 'jlcrochet/vim-crystal'
  Plug 'jlcrochet/vim-ruby' 
  Plug 'nvim-lua/plenary.nvim'
  Plug 'ThePrimeagen/harpoon'
call plug#end()

lua require'harpoon'.setup { mark_branch = true }

:nnoremap <silent> mf :lua require("harpoon.mark").add_file()<CR>
:nnoremap <silent> ms :lua require("harpoon.ui").toggle_quick_menu()<CR>
:nnoremap <silent> mn :lua require("harpoon.ui").nav_next()<CR>
:nnoremap <silent> mp :lua require("harpoon.ui").nav_prev()<CR>
" Aliases for vim-alias package in alias.vim

" :Alias 		src	source\ ~/.config/nvim/init.vim
" :Alias		vim_config 	nvim\ ~/.config/nvim/init.vim

let g:NERDCreateDefaultMappings = 1
let NERDTreeShowHidden=1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

colorscheme tender

hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermfg=132  guifg=#af5f87
