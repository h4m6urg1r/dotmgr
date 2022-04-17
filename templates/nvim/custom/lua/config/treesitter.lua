--[[
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "bash", "json", "html", "lua", "regex", "toml", "yaml" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  },
}
]]

require'nvim-treesitter.configs'.setup({
    ensure_installed = {
        "bash",
        "comment",
        "html",
        "json",
        "lua",
        "python",
        "regex",
        "toml",
        "yaml"
    },
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable=true,
        --keymaps
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        }
    },
    indent = {
        enable=true,
        disable = {"python",},
    },
},
vim.cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]])
)

