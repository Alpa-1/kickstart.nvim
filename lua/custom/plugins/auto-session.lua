---@module 'lazy'
---@type LazySpec
return {
  'rmagatti/auto-session',
  lazy = false,

  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
  },
}
