-- neotree setup
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("neo-tree").setup({
  popup_border_style = "NC",
  window = {
    position = "float",
    popup = {
      size =
      { height = "90%" },
      border = "rounded",
      position = "45%",
    }
  },
  filesystem = {
    hijack_netrw_behavior = "disabled",
    follow_current_file = true,
  }
})
-- mason and lsp setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "solargraph", "rust_analyzer", "elixirls", "sumneko_lua", "dockerls",
  }
})

-- nvim language server setup
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<c-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
end

local servers = {
  "solargraph", "rust_analyzer", "elixirls", "sumneko_lua", "dockerls", -- "cryatalline",
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 }
  }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = false
  }
)

-- nvim-treesitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "ruby", "elixir", "lua", "rust",
    "eex", "elixir", "erlang", "heex", "html", "surface", },
  sync_install = true,
  auto_install = true,
  highlight = {
    enabled = true
  },
  indent = {
    enable = true
  }
}

-- telescope setup
require('telescope').setup{  defaults = { file_ignore_patterns = { "node_modules", "deps", "_build" }} }

-- harpoon setup
local function set_keymap(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end
set_keymap('n', 'mf', ":lua require('harpoon.mark').add_file()<CR>", { noremap = true })
set_keymap('n', 'mm', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true })
set_keymap('n', 'mn', ":lua require('harpoon.ui').nav_next()<CR>", { noremap = true })
set_keymap('n', 'mp', ":lua require('harpoon.ui').nav_prev()<CR>", { noremap = true })

-- nvim-base16 setup
-- tender colorscheme not ready yet
-- require('base16-colorscheme').setup({
--   base00 = '#32302f', -- off white
--   base01 = '#3c3836', -- grey
--   base02 = '#504945', -- comments
--   base03 = '#665c54', -- grey
--   base04 = '#bdae93', -- off white
--   base05 = '#d5c4a1', -- white
--   base06 = '#ebdbb2', -- idk probs numbers
--   base07 = '#fbf1c7', -- idk
--   base08 = '#73cef4', -- calling class
--   base0A = '#73cef4',
-- base09 = '#73cef4', 
-- base0B = '#ffc24b',
-- base0C = '#b3deef', 
-- base0D = '#b3deef',
-- base0E = '#c9d05c',
-- base0F = '#73cef4',
-- })

-- gruvbox colorscheme
require('base16-colorscheme').setup({
  base00 = '#32302f',
  base01 = '#3c3836',
  base02 = '#504945',
  base03 = '#665c54',
  base04 = '#bdae93',
  base05 = '#d5c4a1',
  base06 = '#ebdbb2',
  base07 = '#fbf1c7',
  base08 = '#fb4934',
  base09 = '#fe8019',
  base0A = '#fabd2f',
  base0B = '#b8bb26',
  base0C = '#8ec07c', 
  base0D = '#83a598',
  base0E = '#d3869b',
  base0F = '#d65d0e',
})

   -- black:   '0x282828'
   --  red:     '0xf43753'
   --  green:   '0xc9d05c'
   --  yellow:  '0xffc24b'
   --  blue:    '0xb3deef'
   --  magenta: '0xd3b987'
   --  cyan:    '0x73cef4'
   --  white:   '0xeeeeee'

  -- # Bright colors
  -- bright:
   --  black:   '0x4c4c4c'
   --  red:     '0xf43753'
   --  green:   '0xc9d05c'
   --  yellow:  '0xffc24b'
   --  blue:    '0xb3deef'
   --  magenta: '0xd3b987'
   --  cyan:    '0x73cef4'
   --  white:   '0xfeffff'

vim.api.nvim_exec(
[[
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
]], false)
-- hi TelescopeSelection guibg=NONE ctermbg=NONE
-- hi TelescopePreviewLine guibg=NONE ctermbg=NONE
-- hi TelescopeSelection guibg=NONE ctermbg=NONE
-- hi TelescopePreviewLine guibg=NONE ctermbg=NONE
-- hi StatusLine guibg=NONE ctermbg=NONE
-- hi StatusLineNC guibg=NONE ctermbg=NONE
-- hi WinSeperator guibg=NONE ctermbg=NONE
-- hi VertSplit guibg=NONE ctermbg=NONE

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}
