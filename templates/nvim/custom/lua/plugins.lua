return require('packer').startup(function()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'tanvirtin/monokai.nvim',
        'folke/tokyonight.nvim',
        'olimorris/onedarkpro.nvim',
        'Mangeshrex/uwu.vim',
        'wadackel/vim-dogrun',
        'Avimitin/neovim-deus',
        'joshdick/onedark.vim'
    }
    use {
        'xiyaowong/nvim-transparent',  -- enables transparency
        disable=false,
        config=function()
            require('config/nvim-transparent')
        end
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',  -- Sec c colors
        config = function()
            require('config/treesitter')
        end
    }

    -- Lsp
    use {
        'neovim/nvim-lspconfig',  -- Manages installed lsp
        config = function()
            require('config/nvim-lspconfig')
        end
    }

    -- use {
    --     'kosayoda/nvim-lightbulb',  -- Shows a lightbulb when code action available
    --     after='nvim-lspconfig',
    --     config=function()
    --         vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
    --     end
    -- }

    --[[ this is useless now
    --]]
    use{
        'ray-x/lsp_signature.nvim',  -- Shows variables to be supplied in a function
        after='nvim-lspconfig',
    }

    use 'williamboman/nvim-lsp-installer'

    -- Shows completion available
    use {
        {
            'hrsh7th/nvim-cmp',
            after='nvim-lspconfig',
            config = function()
                require('config/nvim-cmp')
            end
        },
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        -- 'hrsh7th/cmp-nvim-lsp-signature-help',
    }

    -- Snippets completion
    -- use{
    --     'hrsh7th/cmp-vsnip',
    --     'hrsh7th/vim-vsnip'
    -- }
    use {
        {
            '/L3MON4D3/LuaSnip',
            after = 'friendly-snippets',
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                require('luasnip').filetype_extend('global','python')
            end
        },
        'rafamadriz/friendly-snippets',
    }

    -- Code outline helpers (variables and functions)
    use {
        'liuchengxu/vista.vim',
        disable=true,
        opt=true
    }
    use {
        'simrat39/symbols-outline.nvim',
        disable=true,
        opt=true
    }
    use {
        'stevearc/aerial.nvim',
        disable=true,
        opt=true
    }

    -- UI
    use {
        'hoob3rt/lualine.nvim',  -- Status line
        config = function()
            require('config/lualine')
        end
    }

    use {
        'akinsho/bufferline.nvim',
        config = function()
            require('config/bufferline-nvim')
        end
    }

    use {
        'onsails/lspkind-nvim'  -- Adds nerd font icons ( in lualine )
    }

    -- Utils
    use {
        "numtostr/FTerm.nvim",  -- Adds a floating terminal
        config = function()
            require("config/fterm")
        end
    }

    use {
        'windwp/nvim-autopairs',  -- Adds autocompletion for brackets and quotes etc.
        config = function()
            require('config/nvim-autopairs')
        end
    }

    -- Latex helper plugins
    use {
        'lervag/vimtex',
        ft='tex',
        config = function()
            require('config/vimtex')
        end
    }

    -- Handy booklet of keybinds
    use {
        "lazytanuki/nvim-mapper",
        config = function() require("nvim-mapper").setup{} end,
        before = "telescope.nvim"
    }

    -- Collaborative editing
    use 'jbyuki/instant.nvim'

    -- md previewer
    use {{
        'npxbr/glow.nvim',  -- Preview inside neovim floating window
        ft='mdarkdown',
        disable=true
    }, {
        'davidgranstrom/nvim-markdown-preview',
        ft='markdown',
        config=function()
            vim.cmd("let g:nvim_markdown_preview_theme = 'solarized-light'")
        end,
        disable=true
    }, {
        'iamcco/markdown-preview.nvim',  -- Reloads page on buffer update or file change
        ft='markdown',
        disable=false,
        run='cd app && yarn install'
    } }

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}end)
