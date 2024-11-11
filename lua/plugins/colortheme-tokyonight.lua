return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({
			transparent = true,
			on_highlights = function(hl, _)
				hl.LineNr = {
					fg = "#F0E1A1",
				}
				hl.LineNrAbove = {
					fg = "#C6A545",
				}
				hl.LineNrBelow = {
					fg = "#B98D3B",
				}
			end,
		})
		vim.cmd([[colorscheme tokyonight-moon]])
	end,
}
