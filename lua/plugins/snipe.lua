return {
  'leath-dub/snipe.nvim',
  keys = {
    {
      '<leader><leader>',
      function()
        require('snipe').open_buffer_menu()
      end,
      desc = 'Open Snipe buffer menu',
    },
  },
  config = function()
    require('snipe').setup {
      ui = {
        position = 'cursor',
        open_win_override = {
          title = 'Buffers',
          border = 'rounded', -- use "rounded" for rounded border
        },
      },
      hints = {
        dictionary = 'asdfzxcvqwer1234',
      },
      sort = 'first',
    }
  end,
}
