vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

vim.keymap.set('n', 'x', '"_x', opts);


vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set('v', 'p', '"_dp', opts)

-- Bufferline Tab
vim.keymap.set('n', '<C-l>', ':bnext<CR>', opts)
vim.keymap.set('n', '<C-h>', ':bprevious<CR>', opts)


vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)
