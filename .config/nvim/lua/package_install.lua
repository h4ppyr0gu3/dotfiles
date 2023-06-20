require('packer').startup(function(use)
  use {
    "wbthomason/packer.nvim",
    "nvim-lualine/lualine.nvim",
    "tpope/vim-commentary",
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
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "junegunn/fzf", run = function() vim.fn['fzf#install'](0) end,
    "nvim-treesitter/nvim-treesitter", run = function() vim.fn("TSUpdate") end,
    "kyazdani42/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "ThePrimeagen/harpoon",
    "mxw/vim-jsx",
    "RRethy/nvim-base16",
    "tamago324/nlsp-settings.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "jose-elias-alvarez/typescript.nvim",
    "MunifTanjim/prettier.nvim",
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/nvim-cmp",
    "windwp/nvim-ts-autotag",
    "akinsho/nvim-bufferline.lua",
    "simrat39/symbols-outline.nvim",
    "themaxmarchuk/tailwindcss-colors.nvim",
  }
  -- AI code completion
  use { "Exafunction/codeium.vim", config = function ()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  end }
end)
