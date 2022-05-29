" General settings
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set nohlsearch
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set relativenumber
set colorcolumn=0
set path+=**
set wildmenu
set tags=./tags,tags;$HOME
set splitright
set splitbelow
set scrolloff=6
" set foldmethod=syntax " automatically fold all blocks
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting

call plug#begin()
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'duane9/nvim-rg'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-telescope/telescope.nvim'
" syntax highlighting
Plug 'jlcrochet/vim-crystal'
Plug 'jlcrochet/vim-ruby' 
Plug 'elixir-editors/vim-elixir'
Plug 'jparise/vim-graphql'
Plug 'slim-template/vim-slim'
" tender color scheme
Plug 'jacoborus/tender.vim'
call plug#end()

lua require'harpoon'.setup { mark_branch = true }

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
command! MakeTags !ctags\ -R\ .
nnoremap mt :MakeTags<CR>
" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr> 
" copy filepath or working directory to clipboard
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif

nnoremap <silent> mf :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent> ms :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent> mn :lua require("harpoon.ui").nav_next()<CR>
nnoremap <silent> mp :lua require("harpoon.ui").nav_prev()<CR>
nnoremap <silent> lf :Lf<CR>
nnoremap <silent> tb :TagbarToggle<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fzf :FZF<cr>

let g:lf_map_keys = 0

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

colorscheme tender

hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermfg=132  guifg=#af5f87
