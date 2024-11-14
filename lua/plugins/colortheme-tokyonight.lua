return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        local is_neovide = function()
            if vim.g.neovide then
                return true
            end
            return false
        end

        local get_transparent = function()
            if is_neovide() then
                return false
            end
            return true
        end

        require("tokyonight").setup({
            transparent = get_transparent(),
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
        vim.cmd([[colorscheme tokyonight]])
    end,
}
