vim.api.nvim_set_keymap( 'n', '<SPACE>', '<NOP>', {noremap=true})
vim.g.mapleader = ' '

-- INSERT MODE KEYBINDS
vim.api.nvim_set_keymap( 'i', '<C-S>', '<Esc>:w<CR>a', {noremap=true})
vim.api.nvim_set_keymap( 'i', '<C-Z>', '<Esc>ua', {noremap=true})
vim.api.nvim_set_keymap( 'i', '<C-Y>', '<Esc><C-R>a', {noremap=true})

-- NORMAL MODE KEYBINDS

vim.api.nvim_set_keymap( 'n', '<leader>fs', ':w<CR>', {silent=true, noremap=true})      -- Save file in normal mode
