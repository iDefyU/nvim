return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require('flutter-tools').setup {
      widget_guides = {
        -- enabled = true,
      },
      ui = {
        notification_style = 'native',
      },
      lsp = {
        color = {
          virtual_text = true,
        },
      },
      on_attach = function() end,
      messages = function() end,

      settings = {
        lineLength = 120,
        indentStyle = 'tab', -- 'space' 또는 'tab'
        indentWidth = 4,
      },
    }
  end,
}
