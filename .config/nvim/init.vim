lua require("init")

set wildmenu
set nocompatible            
set showmatch              
set ignorecase            
set mouse=v              
set hlsearch            
set incsearch          
set tabstop=2         
set nohlsearch
set softtabstop=2    
set expandtab       
set shiftwidth=2   
set autoindent    
set number       
set wildmode=longest,list    
set mouse=a                 
set clipboard=unnamedplus  
set relativenumber
set colorcolumn=0
set path+=**
set wildmenu
set splitright
set splitbelow
set scrolloff=6
set noswapfile
set wildmode
set wildoptions=pum
set cursorline
set cmdheight=1
set signcolumn=yes

filetype plugin indent on
syntax on

colorscheme tender

hi Normal guibg=NONE ctermbg=NONE
hi LineNr ctermfg=132 guifg=#af5f87
hi clear CursorLine
hi CursorLineNR guibg=NONE ctermbg=NONE ctermfg=184 guifg=#d7d700
hi SignColumn guibg=NONE ctermbg=NONE
hi FloatBorder guibg=NONE ctermbg=NONE
