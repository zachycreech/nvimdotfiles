require 'custom.settings.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  'tpope/vim-sleuth',
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  -- { 'codota/tabnine-nvim', build = '~/development/tabnine-nvim/dl_binaries.sh' },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  require 'kickstart.plugins.indent_line',
  { import = 'custom.plugins' },
  -- { 'github/copilot.vim' },
  { 'tpope/vim-fugitive' },
}
-- require('tabnine').setup {
--   disable_auto_comment = true,
--   accept_keymap = '<Tab>',
--   dismiss_keymap = '<C-]>',
--   debounce_ms = 800,
--   suggestion_color = { gui = '#808080', cterm = 244 },
--   exclude_filetypes = { 'TelescopePrompt', 'NvimTree' },
--   log_file_path = nil, -- absolute path to Tabnine log file
-- }

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
