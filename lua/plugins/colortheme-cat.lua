return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			contrast = true,
			uniform_diff_background = true,
			integrations = {
				noice = true,
			},
			styles = {
				numbers = {},
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
