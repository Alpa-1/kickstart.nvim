---@module 'lazy'
---@type LazySpec
return { -- Statusline with less cryptic configuration
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'ColorScheme',
  config = function()
    require('lualine').setup {
      options = {
        --- @usage 'rose-pine' | 'rose-pine-alt'
        theme = 'rose-pine',
        globalstatus = true,
      },
      sections = {
        lualine_b = {
          {
            'branch',
            fmt = function(str)
              if string.len(str) > 30 then
                return str:sub(1, 30) .. '…'
              else
                return str:sub(1, 30)
              end
            end,
          },
          'diff',
          'diagnostics',
        },
      },
    }
  end,
}
