-- mason and lsp setup
-- require("mason").setup()

local servers = {
  "solargraph"
}

-- require("mason-lspconfig").setup({
--   ensure_installed = servers
-- })

-- require("tailwindcss-colors").setup()

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
  -- buf_set_keymap('n', '<c-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)

  -- require('tailwindcss-colors').buf_attach(bufnr)
end

local util = require 'lspconfig.util'

nvim_lsp.solargraph.setup({
  -- cmd = { "/home/david/.asdf/shims/bundle", "exec", "/home/david/.asdf/shims/solargraph", "stdio" },
  on_attach = on_attach,
  -- root_dir = nvim_lsp.util.root_pattern("Gemfile"),
  cmd = { 'solargraph', 'stdio' },
    settings = {
      solargraph = {
        diagnostics = true,
      },
    },
    init_options = { formatting = true },
    filetypes = { 'ruby' },
    root_dir = util.root_pattern('Gemfile', '.git'),
})

nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
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
require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "ruby", "elixir", "lua",
    "eex", "erlang", "heex", "html", "surface", "tsx", "python" },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "slim" },
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "slim" }
  }
}

-- telescope setup
require('telescope').setup { defaults = { file_ignore_patterns = { } } }

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
  base03 = '#555555', -- comments
  base02 = '#32302f', -- light grey
  base04 = '#bdae93',
  base05 = '#e1e1e1', -- function parameters and brackets
  base06 = '#ebdbb2',
  base07 = '#fbf1c7',
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
    theme = 'ayu_dark',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { 'progress' } },
    lualine_c = { 'location' },
    lualine_x = { 'filetype' },
    lualine_y = { 'tabs' },
    lualine_z = { { 'filename', file_status = true, path = 1 } },
  },
}

--     "L3MON4D3/LuaSnip",
--     "hrsh7th/cmp-nvim-lsp",
--     "hrsh7th/cmp-buffer",
--     "hrsh7th/nvim-cmp",

local status, cmp = pcall(require, "cmp")
if (not status) then return end
-- local lspkind = require 'lspkind'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- ['<CR>'] = cmp.mapping.confirm({
    --   behavior = cmp.ConfirmBehavior.Replace,
    --   select = true
    -- }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
  formatting = {
    -- format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  }
})

-- vim.cmd [[
--   set completeopt=menuone,noinsert,noselect
--   highlight! default link CmpItemKind CmpItemMenuDefault
-- ]]

local status, autotag = pcall(require, "nvim-ts-autotag")
if (not status) then return end

autotag.setup({})


require("symbols-outline").setup()

require("oil").setup({
  -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
  -- Set to false if you still want to use netrw.
  default_file_explorer = true,
  -- Id is automatically added at the beginning, and name at the end
  -- See :help oil-columns
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  -- Buffer-local options to use for oil buffers
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  -- Window-local options to use for oil buffers
  win_options = {
    wrap = false,
    signcolumn = "no",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },
  -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
  delete_to_trash = false,
  -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
  skip_confirm_for_simple_edits = false,
  -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
  -- (:help prompt_save_on_select_new_entry)
  prompt_save_on_select_new_entry = true,
  -- Oil will automatically delete hidden buffers after this delay
  -- You can set the delay to false to disable cleanup entirely
  -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
  cleanup_delay_ms = 2000,
  lsp_file_methods = {
    -- Time to wait for LSP file operations to complete before skipping
    timeout_ms = 1000,
    -- Set to true to autosave buffers that are updated with LSP willRenameFiles
    -- Set to "unmodified" to only save unmodified buffers
    autosave_changes = false,
  },
  -- Constrain the cursor to the editable parts of the oil buffer
  -- Set to `false` to disable, or "name" to keep it on the file names
  constrain_cursor = "editable",
  -- Set to true to watch the filesystem for changes and reload oil
  experimental_watch_for_changes = false,
  -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
  -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
  -- Additionally, if it is a string that matches "actions.<name>",
  -- it will use the mapping at require("oil.actions").<name>
  -- Set to `false` to remove a keymap
  -- See :help oil-actions for a list of all available actions
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-v>"] = "actions.select_vsplit",
    -- ["<C-h>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    -- ["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",
  },
  -- Set to false to disable all of the above keymaps
  use_default_keymaps = false,
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
    -- This function defines what is considered a "hidden" file
    is_hidden_file = function(name, bufnr)
      return vim.startswith(name, ".")
    end,
    -- This function defines what will never be shown, even when `show_hidden` is set
    is_always_hidden = function(name, bufnr)
      return false
    end,
    -- Sort file names in a more intuitive order for humans. Is less performant,
    -- so you may want to set to false if you work with large directories.
    natural_order = true,
    sort = {
      -- sort order can be "asc" or "desc"
      -- see :help oil-columns to see which columns are sortable
      { "type", "asc" },
      { "name", "asc" },
    },
  },
  -- Extra arguments to pass to SCP when moving/copying files over SSH
  extra_scp_args = {},
  -- EXPERIMENTAL support for performing file operations with git
  git = {
    -- Return true to automatically git add/mv/rm files
    add = function(path)
      return false
    end,
    mv = function(src_path, dest_path)
      return false
    end,
    rm = function(path)
      return false
    end,
  },
  -- Configuration for the floating window in oil.open_float
  float = {
    -- Padding around the floating window
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
    -- This is the config that will be passed to nvim_open_win.
    -- Change values here to customize the layout
    override = function(conf)
      return conf
    end,
  },
  -- Configuration for the actions floating preview window
  preview = {
    -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_width and max_width can be a single value or a list of mixed integer/float types.
    -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
    max_width = 0.9,
    -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
    min_width = { 40, 0.4 },
    -- optionally define an integer/float for the exact width of the preview window
    width = nil,
    -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_height and max_height can be a single value or a list of mixed integer/float types.
    -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
    max_height = 0.9,
    -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
    min_height = { 5, 0.1 },
    -- optionally define an integer/float for the exact height of the preview window
    height = nil,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
    -- Whether the preview window is automatically updated when the cursor is moved
    update_on_cursor_moved = true,
  },
  -- Configuration for the floating progress window
  progress = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    width = nil,
    max_height = { 10, 0.9 },
    min_height = { 5, 0.1 },
    height = nil,
    border = "rounded",
    minimized_border = "none",
    win_options = {
      winblend = 0,
    },
  },
  -- Configuration for the floating SSH window
  ssh = {
    border = "rounded",
  },
  -- Configuration for the floating keymaps help window
  keymaps_help = {
    border = "rounded",
  },
})
