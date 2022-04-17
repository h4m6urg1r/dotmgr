-- Options
vim.o.syntax='on'
  -- Turns on mouse
vim.o.mouse='a'
  -- Mr. Mapleader
vim.g.mapleader="\\"

  -- Sets numberline
vim.o.number=true
vim.o.ruler=true

  -- Tab related settings
vim.o.autoindent=true
vim.o.expandtab=true
vim.o.tabstop=4
vim.o.smarttab=true
vim.o.shiftwidth=4
vim.o.softtabstop=4
vim.o.shiftround=true

  -- Shows cursor position
vim.o.cursorline=true
vim.o.cursorcolumn=true

  -- Shows last used command in status line
vim.o.showcmd=true

  -- Use highlighting when doing a search
vim.o.showmatch=true
  -- Highlight while searching
vim.o.hlsearch=true
  -- Ignores capitalisation while searching
vim.o.ignorecase=true
  -- Incremental search that shows partial matches
vim.o.incsearch=true
  -- Automatically switch search to case-sensitive when search query contains an uppercase letter
vim.o.smartcase=true

  -- Always try to show a paragraph’s last line.
vim.opt.display = vim.opt.display + 'lastline'
  -- Use an encoding that supports unicode.
vim.o.encoding='utf-8'
  -- Avoid wrapping a line in the middle of a word.
vim.o.linebreak=true
  -- The number of screen lines to keep above and below the cursor
vim.o.scrolloff=1
  -- The number of screen columns to keep to the left and right of the cursor
vim.o.sidescrolloff=5
  -- Enable line wrapping.
vim.o.wrap=true  -- use :set wrap! to disable wrap
  -- Set the commands to save in history default number is 20.
vim.o.history=1000
  -- Disables fold at startup
vim.o.foldenable=false
--vim.o.completeopt='menu,menuone,noselect'
vim.opt.termguicolors = true

vim.o.inccommand='nosplit'
  -- Swap files folder
vim.o.dir='/home/shantnu/.cache/nvim/swaps/'
vim.cmd 'colorscheme monokai_pro'
--[[ vim.cmd [[
    fu! SaveSess()
        execute 'mksession! ' . getcwd() . '/.session.vim'
    endfunction

    fu! RestoreSess()
    if filereadable(getcwd() . '/.session.vim')
        execute 'so ' . getcwd() . '/.session.vim'
        if bufexists(1)
            for l in range(1, bufnr('$'))
                if bufwinnr(l) == -1
                    exec 'sbuffer ' . l
                endif
            endfor
        endif
    endif
    endfunction

    autocmd VimLeave * call SaveSess()
    autocmd VimEnter * nested call RestoreSess()
]]
