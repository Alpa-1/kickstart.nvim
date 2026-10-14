---@module 'lazy'
---@type LazySpec
return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'thenbe/neotest-playwright',
    'marilari88/neotest-vitest',
    { 'fredrikaverpil/neotest-golang', version = '*' }, -- Installation
  },
  keys = {
    -- stylua: ignore start
    { '<leader>tr', function() require('neotest').run.run() end, desc = 'Run Nearest Test' },
    { '<leader>ta', function() require('neotest').run.run(vim.fn.expand('%')) end, desc = 'Run All Tests (File)' },
    { '<leader>ts', function() require('neotest').summary.toggle() end, desc = 'Toggle Test Summary' },
    { '<leader>to', function() require('neotest').output.open({ enter = true }) end, desc = 'Show Test Output' },
    { '<leader>tw', function() require('neotest').watch.toggle(vim.fn.expand('%')) end, desc = 'Watch Current File' },
    { '<leader>tn', function() require('neotest').jump.next({ status = 'failed' }) end, desc = 'Jump Next Failed' },
    { '<leader>tb', function() require('neotest').jump.prev({ status = 'failed' }) end, desc = 'Jump Prev Failed' },
    -- stylua: ignore end
  },
  config = function()
    --- @type neotest.Config
    local config = {
      runner = 'gotestsum',
      go_test_args = { '-tags', 'integration_test' },
      dap_go_opts = {
        delve = {
          build_flags = { '-tags=integration_test' },
        },
      },
    }
    require('neotest').setup {
      log_level = vim.log.levels.INFO,
      adapters = {
        require 'neotest-golang'(config),
        require 'neotest-vitest',
        require('neotest-playwright').adapter {
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
          },
        },
      },
    }
  end,
}
