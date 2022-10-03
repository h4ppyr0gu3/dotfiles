require("package_install")
require("package_config")
Func = require("functions")

-- key mapping
vim.g.mapleader = " "

function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--  copy file path or directory to clipboard
map("n", "yf", ":let @+=expand('%:p')<CR>")
map("n", "yd", ":let @+=expand('%:p:h')<CR>")
-- enter for new line
map("n", "<CR>", ":a<CR><CR>.<CR>")
-- use control plus vim direction to change window
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
-- mappings for installed packages
map("n", "<leader>lf", ":Neotree<CR>")
map("n", "<leader>tr", ":Explore<CR>")
map("n", "<leader>fz", ":FZF<CR>")
map("n", "<leader>tb", ":TagbarToggle<CR>")
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fwh", "<cmd>Telescope find_files hidden=true<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
-- buffer prev, next, quit
map("n", "<leader>n", ":bn<CR>")
map("n", "<leader>p", ":bp<CR>")
map("n", "<leader>q", ":bd<CR>")
-- move lines up or down
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
-- custom function calls
map("n", "<C-l>", ":lua print(vim.inspect())<Left><Left>")
map("n", "cif", ":lua Func.replace_inside_function()<CR>o")

