local M = {}

M.get_buffer_absolute = function()
  return vim.fn.expand '%:p'
end

M.get_buffer_cwd_relative = function()
  return vim.fn.expand '%:.'
end

M.yank_path = function(path, label)
  vim.fn.setreg('+', path)
  print('Yanked ' .. label .. ' path: ' .. path)
end

M.yank_visual_with_path = function(path, label)
  -- Get visual selection marks (these are set after leaving visual mode)
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local start_col = vim.fn.col("'<")
  local end_col = vim.fn.col("'>")
  
  -- Format the line range
  local line_range = start_line == end_line and tostring(start_line) or start_line .. '-' .. end_line
  local result = path .. ':' .. line_range
  
  -- Yank to system clipboard
  vim.fn.setreg('+', result)
  
  -- Visual feedback with highlight
  local ns = vim.api.nvim_create_namespace('yank_highlight')
  vim.highlight.range(0, ns, 'IncSearch', 
    { start_line - 1, start_col - 1 }, 
    { end_line - 1, end_col }, 
    { priority = 200 }
  )
  vim.defer_fn(function()
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
  end, 150)
end

return M