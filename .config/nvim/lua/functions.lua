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

function M.execute_file()
  local current_file = vim.api.nvim_buf_get_name(0)
  local file_type = vim.bo.filetype

  if file_type == 'lua' then
    local output = vim.fn.system('lua ' .. current_file)
    print(output)
  elseif file_type == 'python' then
    local output = vim.fn.system('python ' .. current_file)
    print(output)
  elseif file_type == 'ruby' then
    local output = vim.fn.system('ruby ' .. current_file)
    print(output)
  end
end

return M
