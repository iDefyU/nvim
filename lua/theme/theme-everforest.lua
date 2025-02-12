return {

  'neanias/everforest-nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('everforest').setup {
      transparent = not vim.g.neovide,
    }
    vim.cmd [[colorscheme everforest]]
  end,
}
