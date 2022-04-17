vim.g.mapleader = '\\'
vim.api.nvim_set_keymap( 'i', '<C-S>', '<Esc>:w<CR>a', {noremap=true})
vim.api.nvim_set_keymap( 'i', '<C-Z>', '<Esc>ua', {noremap=true})
vim.api.nvim_set_keymap( 'i', '<C-Y>', '<Esc><C-R>a', {noremap=true})
