local wk = require('which-key')

vim.api.nvim_set_keymap('n', '<SPACE>', '<NOP>', { noremap = true })
vim.g.mapleader = ' '

--[[
wk.register({
    ['<leader>'] = {
        
    }
},
    {
        mode = '',
        silent = true,
        noremap = true
    }
)
--]]

-- INSERT MODE KEYBINDS
wk.register({
    ['<C-S>'] = { '<C-O>:w<CR>a', 'Save File' },
    ['<C-Z>'] = { '<C-O>u', 'Undo' },
    ['<C-Y>'] = { '<C-O><C-R>', 'Redo' }
},
    {
        mode = 'i',
        silent = true,
        noremap = true
    }
)

-- NORMAL MODE KEYBINDS

wk.register({
    ['<C-U>'] = { '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1, \'<C-U>\')<CR>', '' },
    ['<C-D>'] = { '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1, \'<C-U>\')<CR>', '' },
    ['['] = {
        d = { '<cmd>Lspsaga diagnostic_jump_prev<CR>', 'Jump to previous diagnostic' },
    },
    [']'] = {
        d = { '<cmd>Lspsaga diagnostic_jump_next<CR>', 'Jump to next diagnostic' },
    },
    ['<leader>'] = {
        b = {
            name = '+buffer',
            p = { '', 'Go to revious buffer' }
        },
        c = {
            name = '+code',
            a = { '<cmd>Lspsaga code_action<cr>', 'Code Action' },
            d = { '<cmd>Lspsaga show_line_diagnostics<CR>', 'Show diagnostics' },
            f = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format code' },
            l = {
                name = '+lsp',
                d = { '<cmd>Lspsaga hover_doc<CR>', 'Show docs' },
                D = { '<cmd>Lspsaga preview_definition<CR>', 'Show definition' },
                f = { '<cmd>Lspsaga lsp_finder<CR>', 'Find something with the help of lsp' },
                r = {
                    name = '+refactor',
                },
            },
            o = { '', 'Organize imports'},
            r = { '<cmd>Lspsaga rename<cr>', 'Rename variable' },
            s = { '<cmd>Lspsaga signature_help<CR>', 'Show signature' }
        },
        f = {
            name = '+file',
            s = { '<cmd>update<CR>', 'Save file' },
        },
        t = {
            name = '+toggle',
            t = { '', 'Terminal' }
        },
        w = {
            n = { '<cmd>new<CR>', 'Open new window' },
        },
    },
},
    {
        mode = 'n',
        silent = true,
        noremap = true
    }
)

-- VISUAL MODE KEYBINDS
wk.register({
    ['<leader>'] = {
        c = {
            a = { '<cmd><C-U>Lspsaga range_code_action<CR>', 'Code action' }
        }
    }
},
    {
        mode = 'v',
        silent = true,
        noremap = true
    }
)
