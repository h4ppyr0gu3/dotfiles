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
    enable = false,
    disable = {"ruby", "elixir"}
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

