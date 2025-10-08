local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require("pckr").add{
  "nvim-lualine/lualine.nvim";
  "tpope/vim-commentary";
  "junegunn/fzf.vim";
  "duane9/nvim-rg";
  "nvim-telescope/telescope.nvim";
  -- "jlcrochet/vim-crystal";
  "voldikss/vim-floaterm";
  "jlcrochet/vim-ruby";
  -- "tbastos/vim-lua";
  -- "elixir-editors/vim-elixir";
  -- "jparise/vim-graphql";
  -- "slim-template/vim-slim";
  "nvim-lua/plenary.nvim";
  "williamboman/mason.nvim";
  "williamboman/mason-lspconfig.nvim";
  "neovim/nvim-lspconfig";
  "junegunn/fzf"; run = function() vim.fn['fzf#install'](0) end;
  "nvim-treesitter/nvim-treesitter"; run = function() vim.fn("TSUpdate") end;
  "kyazdani42/nvim-web-devicons";
  "MunifTanjim/nui.nvim";
  "ThePrimeagen/harpoon";
  "mxw/vim-jsx";
  "RRethy/base16-nvim";
  "tamago324/nlsp-settings.nvim";
  "jose-elias-alvarez/null-ls.nvim";
  -- "jose-elias-alvarez/typescript.nvim";
  "MunifTanjim/prettier.nvim";
  "L3MON4D3/LuaSnip";
  "hrsh7th/cmp-nvim-lsp";
  "hrsh7th/cmp-buffer";
  "hrsh7th/nvim-cmp";
  "windwp/nvim-ts-autotag";
  "akinsho/nvim-bufferline.lua";
  "simrat39/symbols-outline.nvim";
  -- "themaxmarchuk/tailwindcss-colors.nvim";
  "stevearc/oil.nvim";
  { "Exafunction/windsurf.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function ()
      require("codeium").setup({
        -- Optionally disable cmp source if using virtual text only
        -- enable_cmp_source = false,
        virtual_text = {
          enabled = true,

          -- -- These are the defaults

          -- -- Set to true if you never want completions to be shown automatically.
          -- manual = false,
          -- -- A mapping of filetype to true or false, to enable virtual text.
          filetypes = {
            slim = false,
            txt = false
          },
          -- -- Whether to enable virtual text of not for filetypes not specifically listed above.
          -- default_filetype_enabled = true,
          -- -- How long to wait (in ms) before requesting completions after typing stops.
          -- idle_delay = 75,
          -- -- Priority of the virtual text. This usually ensures that the completions appear on top of
          -- -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
          -- -- desired.
          -- virtual_text_priority = 65535,
          -- -- Set to false to disable all key bindings for managing completions.
          -- map_keys = true,
          -- -- The key to press when hitting the accept keybinding but no completion is showing.
          -- -- Defaults to \t normally or <c-n> when a popup is showing. 
          -- accept_fallback = nil,
          -- -- Key bindings for managing completions in virtual text mode.
          key_bindings = {
            -- Accept the current completion.
            accept = "<C-o>",
            -- Accept the next word.
            accept_word = false,
            -- Accept the next line.
            accept_line = false,
            -- Clear the virtual text.
            clear = false,
            -- Cycle to the next completion.
            next = "<M-]>",
            -- Cycle to the previous completion.
            prev = "<M-[>",
          }
        }
      })
    end
  };
}
-- AI code completion
