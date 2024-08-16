local function commentstring(element, prev_element)
  -- Check if the element has any content
  if #element == 0 then
    return ''
  end

  -- Check if the previous element exists
  if prev_element == nil then
    return ''
  end

  -- Check if the previous element is in the same line
  if element:start() == prev_element:end_() then
    return ''
  end

  -- Calculate the number of lines in the element
  local start_line = element:start()
  local end_line = element:end_()
  local num_lines = end_line - start_line + 1

  -- If the element spans more than three lines, display a shortened version
  if num_lines > 3 then
    return '...[more lines]'
  end

  -- Get the current line
  local line = vim.api.nvim_buf_get_lines(0, start_line, start_line + 1, false)[1]

  -- Return the original line
  return line
end

return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
          ['*'] = commentstring,
        },
      },
    }
  end,
}
