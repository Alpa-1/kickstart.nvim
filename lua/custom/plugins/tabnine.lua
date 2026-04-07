---@module 'lazy'
---@type LazySpec
return {
  'codota/tabnine-nvim',
  run = './dl_binaries.sh ' .. 'https://tabnine.stackit.run' .. '/update',
  config = function()
    require('tabnine').setup {
      disable_auto_comment = true,
      accept_keymap = '<C-a>',
      dismiss_keymap = '<C-]>',
      debounce_ms = 800,
      suggestion_color = { gui = '#a6a6a6', cterm = 244 },
      codelens_color = { gui = '#a6a6a6', cterm = 244 },
      codelens_enabled = false,
      exclude_filetypes = { 'TelescopePrompt', 'NvimTree' },
      tabnine_enterprise_host = 'https://tabnine.stackit.run',
      ignore_certificate_errors = false,
    }
  end,
}
