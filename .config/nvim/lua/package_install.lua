require('packer').startup(function(use)
  use {
    "wbthomason/packer.nvim",
    "vim-airline/vim-airline",
    "tpope/vim-commentary",
    "preservim/tagbar",
    "junegunn/fzf.vim",
    "duane9/nvim-rg",
    "nvim-telescope/telescope.nvim",
    "jlcrochet/vim-crystal",
    "voldikss/vim-floaterm",
    "jlcrochet/vim-ruby",
    "tbastos/vim-lua",
    "elixir-editors/vim-elixir",
    "jparise/vim-graphql",
    "slim-template/vim-slim",
    "joshdick/onedark.vim",
    "jacoborus/tender.vim",
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "junegunn/fzf", run = function() vim.fn['fzf#install'](0) end,
    'rafcamlet/nvim-luapad',
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter", run = function() vim.fn("TSUpdate") end,
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "nvim-neo-tree/neo-tree.nvim", branch = "v2.x",
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }
  --use "numToStr/FTerm.nvim"
  --use "~/api-nvim"
end)
