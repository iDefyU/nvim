vim.g.neovide_transparency = 0.78
vim.g.neovide_window_blurred = true

vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_vfx_mode = "ripple"

-- vim.o.guifont = "*"
vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_cursor_animation_length = 0.04
vim.g.neovide_cursor_trail_size = 0.7

vim.g.neovide_scroll_animation_length = 0

vim.g.neovide_padding_top = 3
vim.g.neovide_padding_bottom = 3
vim.g.neovide_padding_right = 3
vim.g.neovide_padding_left = 3

-- key binding
vim.keymap.set("n", "<D-v>", '"+P')          -- copy
vim.keymap.set("v", "<D-v>", '"+P')          -- copy
vim.keymap.set("n", "<D-c>", '"+y')          -- copy
vim.keymap.set("c", "<D-v>", '"<C-R>+')      -- copy
vim.keymap.set("i", "<D-v>", '"<ESC>l"+Pli') -- copy
