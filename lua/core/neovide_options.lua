vim.opt.linespace = -1
vim.g.neovide_padding_top = 2
vim.g.neovide_padding_bottom = 2
vim.g.neovide_padding_right = 2
vim.g.neovide_padding_left = 2

-- Helper function for transparency formatting
-- vim.g.transparency = 0.1
-- local alpha = function()
--   return string.format('%x', math.floor(255 * (vim.g.transparency or 0.1)))
-- end
-- vim.g.neovide_background_color = '#0f1117' .. alpha()
-- vim.g.neovide_transparency = 0.8
--
-- vim.g.neovide_window_blurred = true

vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_animation_length = 0.13
vim.g.neovide_cursor_trail_size = 0.8
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_smooth_blink = false
vim.g.neovide_cursor_vfx_mode = 'sonicboom'

vim.keymap.set('v', '<D-c>', '"+y')
vim.keymap.set('n', '<D-v>', '"+P')
vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli')
vim.keymap.set('v', '<D-v>', '+P')
vim.keymap.set('c', '<D-v>', '<C-R>+')
