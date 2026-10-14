local session_group = vim.api.nvim_create_augroup('AutoSessionOnWrite', { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
  group = session_group,
  pattern = '*',
  desc = 'Save auto-session whenever a file is written',
  callback = function()
    -- Check if auto-session is loaded to prevent errors on lazy-loaded setups
    local has_auto_session, auto_session = pcall(require, 'auto-session')
    if has_auto_session then
      auto_session.save_session(nil, { show_message = false })
    end
  end,
})

---@module 'lazy'
---@type LazySpec
return {
  'rmagatti/auto-session',
  lazy = true,
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { '<leader>ws', '<cmd>AutoSession search<CR>', desc = 'Session search' },
    { '<leader>ww', '<cmd>AutoSession save<CR>', desc = 'Save session' },
    { '<leader>wa', '<cmd>AutoSession toggle<CR>', desc = 'Toggle autosave' },
  },

  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    session_lens = {
      picker = 'telescope', -- "telescope"|"snacks"|"fzf"|"select"|nil Pickers are detected automatically but you can also manually choose one. Falls back to vim.ui.select
      mappings = {
        -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
        delete_session = { 'i', '<C-d>' },
        alternate_session = { 'i', '<C-s>' },
        copy_session = { 'i', '<C-y>' },
      },

      picker_opt = {
        border = true,
        layout_config = {
          width = 0.9, -- Can set width and height as percent of window
          height = 0.8,
        },
      },
      load_on_setup = true,
    },
    -- log_level = 'debug',
  },
}
