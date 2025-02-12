return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {},
  config = function()
    local wk = require 'which-key'
    wk.add {
      { '<leader>s', group = '[S]earch' },
      { '<leader>g', group = '[G]it' },
    }
  end,
}
