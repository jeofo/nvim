-- Editor Behavior
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cmdheight = 0
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', trail = '·', nbsp = '␣', extends = '»', precedes = '«', eol = '↲' }
vim.opt.scrolloff = 4
vim.opt.ttimeoutlen = 0
vim.opt.viewoptions = 'cursor,folds,slash,unix'
vim.opt.wrap = true
vim.opt.tw = 0
vim.opt.indentexpr = ''
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.foldenable = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shortmess = vim.opt.shortmess + 'cI'
vim.opt.inccommand = 'split'
vim.opt.completeopt = 'longest,noinsert,noselect,menuone'
vim.opt.ttyfast = true
vim.opt.lazyredraw = true
vim.opt.visualbell = true
vim.opt.spelllang = 'en_us'
vim.opt.updatetime = 100
vim.opt.conceallevel = 0 
vim.opt.virtualedit = 'block'
vim.opt.autoread = true
vim.opt.winborder = "rounded"
vim.opt.iskeyword:remove('_')
vim.opt.clipboard = 'unnamedplus'

-- Auto-reload files when they change externally
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime",
})

-- Persistent Undo
if vim.fn.has('unix') == 1 then
  vim.fn.system('silent !mkdir -p $HOME/.config/nvim/tmp/backup')
  vim.fn.system('silent !mkdir -p $HOME/.config/nvim/tmp/undo')
  vim.fn.system('silent !mkdir -p $HOME/.config/nvim/spell')
end

vim.opt.spellfile = vim.fn.expand('$HOME/.config/nvim/spell/en.utf-8.add')
vim.opt.backupdir = vim.fn.expand('$HOME/.config/nvim/tmp/backup')
vim.opt.directory = vim.fn.expand('$HOME/.config/nvim/tmp/backup')

if vim.fn.has('persistent_undo') == 1 then
  vim.opt.undofile = true
  vim.opt.undodir = vim.fn.expand('$HOME/.config/nvim/tmp/undo')
end

-- Terminal Behavior
vim.g.neoterm_autoscroll = 1
vim.cmd('autocmd TermOpen term://* startinsert')

-- Load keymaps
require('config.keymap')

-- Load plugins
require('config.plugins')

-- Language support autocmds
vim.api.nvim_create_autocmd({ "BufEnter", "BufLeave" }, {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function(args)
    if args.event == "BufEnter" then
      vim.cmd("syntax sync fromstart")
    else
      vim.cmd("syntax sync clear")
    end
  end,
})

-- Activate Otter for Quarto files
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*.qmd',
  callback = function()
    vim.defer_fn(function()
      require('otter').activate()
    end, 100)
  end,
  desc = "Activate Otter for Quarto files"
})
