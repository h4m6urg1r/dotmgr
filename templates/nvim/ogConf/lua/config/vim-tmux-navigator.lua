vim.g.tmux_navigator_no_mappings = 1

vim.api.nvim_set_keymap('n', '<M-h>', ':TmuxNavigateLeft<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<M-j>', ':TmuxNavigateDown<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<M-k>', ':TmuxNavigateUp<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<M-l>', ':TmuxNavigateRight<cr>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<M-\\>', ':TmuxNavigatePrevious<cr>', {noremap=true, silent=true})
