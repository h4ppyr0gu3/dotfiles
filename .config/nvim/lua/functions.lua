M = {}

function M.replace_inside_function()
  local ts_utils = require('nvim-treesitter.ts_utils')
  local current_node = ts_utils.get_node_at_cursor() 

  if not current_node then return "" end

  while current_node do
    if current_node:type() == 'method' then
      break
    end
    current_node = current_node:parent()
  end

  local start_line_nr = current_node:start()
  local end_line_nr = current_node:end_()
  start_line_nr = start_line_nr + 1
  vim.api.nvim_buf_set_lines(0, start_line_nr, end_line_nr, true, {})
  vim.api.nvim_win_set_cursor(0, {start_line_nr, 0})
end

return M
