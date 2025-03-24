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
" set nowrap
" set paste
set clipboard+=unnamedplus  
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

" highlight overrides
hi Normal guibg=NONE ctermbg=NONE
hi clear LineNr
hi LineNr ctermfg=132 guifg=#af5f87
hi clear CursorLine
hi CursorLineNR guibg=NONE ctermbg=NONE ctermfg=184 guifg=#d7d700
hi SignColumn guibg=NONE ctermbg=NONE
hi FloatBorder guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi NormalFloat guibg=NONE ctermbg=NONE
hi TelescopeNormal guibg=NONE ctermbg=NONE
hi TelescopeBorder guibg=NONE ctermbg=NONE
hi TelescopePromptBorder guibg=NONE ctermbg=NONE
hi TelescopePromptNormal guibg=NONE ctermbg=NONE
hi TelescopePromptPrefix guibg=NONE ctermbg=NONE
hi TelescopePreviewTitle guibg=NONE ctermbg=NONE
hi TelescopePromptTitle guibg=NONE ctermbg=NONE
hi TelescopeResultsTitle guibg=NONE ctermbg=NONE

let g:netrw_banner=0
let g:codeium_enabled = v:true

" tender colorscheme by https://github.com/jacoborus adopted for 16 bit
"   base00 = '#32302f', -- dark grey
"   base01 = '#3c3836',
"   base03 = '#555555', -- comments
"   base02 = '#504945', -- light grey
"   base04 = '#bdae93',
"   base05 = '#e1e1e1', -- function parameters and brackets
"   base06 = '#ebdbb2',
"   base07 = '#fbf1c7',
"   base08 = '#e1e1e1', -- variable declaration and function call params
"   base0B = '#d3b987', -- strings and keys
"   base0D = '#b3deef', -- function calls
"   base09 = '#ffc24b', -- values ,int , boolean
"   base0A = '#73cef4', -- class Reference
"   base0C = '#8ec07c',
"   base0F = '#f43753', -- commas and dots
"   base0E = '#c9d05c', -- keywords class, def

