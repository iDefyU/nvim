return {
  'catppuccin/nvim',
  name = 'catppuccin',
  flavour = 'mocha',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      transparent_background = not vim.g.neovide,

      highlight_overrides = {
        all = function(colors)
          return {
            LineNr = { fg = '#ffffff' },
            LineNrAbove = { fg = '#8a8a8a' },
            LineNrBelow = { fg = '#8a8a8a' },
            NvimTreeNormal = { fg = colors.none },
          }
        end,
      },

      integrations = {
        gitsigns = true,
        treesitter = true,
        nvimtree = true,
      },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
