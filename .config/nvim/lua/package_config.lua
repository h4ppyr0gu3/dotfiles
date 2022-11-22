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
    enable = true,
    additional_vim_regex_highlighting = true,
  },
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

-- tender colorscheme
require('base16-colorscheme').setup({
  base00 = '#32302f', -- dark grey
  base01 = '#3c3836',
  base02 = '#504945', -- light grey
  base04 = '#bdae93',
  base06 = '#ebdbb2',
  base07 = '#fbf1c7',

  base03 = '#3f3f3f', -- comments
  base05 = '#e1e1e1', -- function parameters and brackets
  base08 = '#e1e1e1', -- variable declaration and function call params
  base0B = '#d3b987', -- strings and keys
  base0D = '#b3deef', -- function calls
  base09 = '#ffc24b', -- values ,int , boolean
  base0A = '#73cef4', -- class Reference
  base0C = '#8ec07c',
  base0F = '#f43753', -- commas and dots
  base0E = '#c9d05c', -- keywords class, def
})

-- gruvbox colorscheme
-- require('base16-colorscheme').setup({
--   base00 = '#32302f',
--   base01 = '#3c3836',
--   base02 = '#504945',
--   base03 = '#665c54',
--   base04 = '#bdae93',
--   base05 = '#d5c4a1',
--   base06 = '#ebdbb2',
--   base07 = '#fbf1c7',
--   base08 = '#fb4934',
--   base09 = '#fe8019',
--   base0A = '#fabd2f',
--   base0B = '#b8bb26',
--   base0C = '#8ec07c', 
--   base0D = '#83a598',
--   base0E = '#d3869b',
--   base0F = '#d65d0e',
-- })

-- lualine setup
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'location'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'filename'}
  },
}
