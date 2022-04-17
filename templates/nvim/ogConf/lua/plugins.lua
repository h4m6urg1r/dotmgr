--[[

use {
  'myusername/example',        -- The plugin location string
  -- The following keys are all optional
  disable = boolean,           -- Mark a plugin as inactive
  as = string,                 -- Specifies an alias under which to install the plugin
  installer = function,        -- Specifies custom installer. See "custom installers" below.
  updater = function,          -- Specifies custom updater. See "custom installers" below.
  after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
  rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
  opt = boolean,               -- Manually marks a plugin as optional.
  branch = string,             -- Specifies a git branch to use
  tag = string,                -- Specifies a git tag to use
  commit = string,             -- Specifies a git commit to use
  lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
  run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
  requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
  rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
  config = string or function, -- Specifies code to run after this plugin is loaded.
  -- The setup key implies opt = true
  setup = string or function,  -- Specifies code to run before this plugin is loaded.
  -- The following keys all imply lazy-loading and imply opt = true
  cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
  ft = string or list,         -- Specifies filetypes which load this plugin.
  keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
  event = string or list,      -- Specifies autocommand events which load this plugin.
  fn = string or list          -- Specifies functions which load this plugin.
  cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
  module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
                               -- with one of these module names, the plugin will be loaded.
  module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
  requiring a string which matches one of these patterns, the plugin will be loaded.
}

]]
local util = require('packer.util')

require('packer').init({
  ensure_dependencies   = true, -- Should packer install plugin dependencies?
  package_root   = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
  compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
  plugin_package = 'packer', -- The default package for plugins
  max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
  auto_clean = true, -- During sync(), remove unused plugins
  compile_on_sync = true, -- During sync(), run packer.compile()
  disable_commands = false, -- Disable creating commands
  opt_default = false, -- Default to using opt (as opposed to start) plugins
  transitive_opt = true, -- Make dependencies of opt plugins also opt by default
  transitive_disable = true, -- Automatically disable dependencies of disabled plugins
  auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
  git = {
    cmd = 'git', -- The base command for git operations
    subcommands = { -- Format strings for git subcommands
      update         = 'pull --ff-only --progress --rebase=false',
      install        = 'clone --depth %i --no-single-branch --progress',
      fetch          = 'fetch --depth 999999 --progress',
      checkout       = 'checkout %s --',
      update_branch  = 'merge --ff-only @{u}',
      current_branch = 'branch --show-current',
      diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
      diff_fmt       = '%%h %%s (%%cr)',
      get_rev        = 'rev-parse --short HEAD',
      get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
      submodules     = 'submodule update --init --recursive --progress'
    },
    depth = 1, -- Git clone depth
    clone_timeout = 3600, -- Timeout, in seconds, for git clones
    default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
  },
  display = {
    non_interactive = false, -- If true, disable display windows for all operations
    open_fn  = util.float, -- An optional function to open a window for packer's display
    open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
    working_sym = '⟳', -- The symbol for a plugin being installed/updated
    error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
    done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
    removed_sym = '-', -- The symbol for an unused plugin which was removed
    moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = '━', -- The symbol for the header line in packer's display
    show_all_info = true, -- Should packer show all update details automatically?
    prompt_border = 'double', -- Border style of prompt popups.
    keybindings = { -- Keybindings for the display window
      quit = 'q',
      toggle_info = '<CR>',
      diff = 'd',
      prompt_revert = 'r',
    }
  },
  luarocks = {
    python_cmd = 'python' -- Set the python command to use for running hererocks
  },
  log = { level = 'warn' }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
  profile = {
    enable = true,
    threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
  }
})


return require('packer').startup(function(use)

    -- Packer managing itself
    use 'wbthomason/packer.nvim'

    -- Themes

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
        'dylanaraps/wal.vim',  -- pywal integration
        disable = true
    }
    use {
        'xiyaowong/nvim-transparent',  -- enables transparency
        disable=false,
        config=function()
            require('config/nvim-transparent')
        end
    }

    -- Lsp
    use {
        'neovim/nvim-lspconfig',  -- Manages installed lsp
        config = function()
            require('config/nvim-lspconfig')
        end
    }

    use {
        'kosayoda/nvim-lightbulb',  -- Shows a lightbulb when code action available
        after='nvim-lspconfig',
        config=function()
            vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
        end
    }

    --[[
    use{
        'ray-x/lsp_signature.nvim',  -- Shows variables to be supplied in a function
        after='nvim-lspconfig',
    }
    ]]

    use 'williamboman/nvim-lsp-installer'
    -- LSP bs ends here

    -- Shows completion available
    use {
        {
            'hrsh7th/nvim-cmp',
            after='nvim-lspconfig',
            config = function()
                require('config/nvim-cmp')
            end
        },
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp'
    }

    -- Snippets completion
    use{
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip'
    }

    use {
        'nvim-treesitter/nvim-treesitter',  -- Sec c colors
        config = function()
            require('config/treesitter')
        end
    }

 --  use {
 --       'nvim-treesitter/nvim-treesitter-textobjects',  -- Idk how to explain
 --   }

 --   use {
 --       'rrethy/nvim-treesitter-textsubjects',  -- Idk how to explain
 --   }


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
    -- End of code outline helpers

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
    -- End of latex helper plugins

    -- md preview helpers
    use {
        'npxbr/glow.nvim',  -- Preview inside neovim floating window
        ft='mdarkdown',
        disable=true
    }
    use {
        'davidgranstrom/nvim-markdown-preview',
        ft='markdown',
        config=function()
            vim.cmd("let g:nvim_markdown_preview_theme = 'solarized-light'")
        end,
        disable=true
    }
    use {
        'iamcco/markdown-preview.nvim',  -- Reloads page on buffer update or file change
        ft='markdown',
        disable=false,
        run='cd app && yarn install'
    }
    -- End of md preview helpers

    use {
        'chrisbra/Colorizer'  -- visualise hex colorcode
    }

    use {
        'danilamihailov/vim-tips-wiki'    -- for getting some tips and tricks
    }

    use 'vitalk/vim-shebang'

    use {
        'christoomey/vim-tmux-navigator',
        config=function()
            require('config/vim-tmux-navigator')
        end
    }

    use {
        'michaelb/sniprun',
        config = function()
            require('config/sniprun')
        end,
        run = 'bash install.sh'
    }

    use {
        'untitled-ai/jupyter_ascending.vim'
    }

    use {
        'Vimjas/vim-python-pep8-indent'
    }

    use {
        'artur-shaik/vim-javacomplete2',
        config = vim.cmd([[
        autocmd FileType java setlocal omnifunc=javacomplete#Complete
        ]])
    }

    use {
        'elkowar/yuck.vim',
    }
    --[[
    use {
        ''
    }
]]

end)
