return {
    "leath-dub/snipe.nvim",
    keys = {
        {
            "<leader>g",
            function()
                require("snipe").open_buffer_menu()
            end,
            desc = "Open Snipe buffer menu",
        },
    },
    config = function()
        require("snipe").setup({})
    end,
}
