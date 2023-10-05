-- Editor Behavior
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
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
vim.opt.formatoptions = vim.opt.formatoptions - 'tc'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.inccommand = 'split'
vim.opt.completeopt = 'longest,noinsert,noselect,menuone,preview'
vim.opt.ttyfast = true
vim.opt.lazyredraw = true
vim.opt.visualbell = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.spelllang = 'en_us'
vim.colorcolumn = '80'
vim.opt.updatetime = 100
vim.opt.virtualedit = 'block'
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
vim.api.nvim_set_keymap('t', '<C-N>', '<C-\\><C-N>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-O>', '<C-\\><C-N><C-O>', { noremap = true })


-- Remap Keys

-- Helper Functions
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function noremap(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true})
end

function nnoremap(shortcut, command)
  noremap('n', shortcut, command)
end

function anoremap(shortcut, command)
  noremap('n', shortcut, command)
  noremap('v', shortcut, command)
end
-- Set <LEADER> as <SPACE>, ; as :
vim.g.mapleader = ' '
anoremap(';', ':')

-- Save and Quit
anoremap('Q', ':q<CR>')
anoremap('<C-q>', ':qa<CR>')
anoremap('S', ':w<CR>')

-- Undo and Redo
anoremap('l','u')
anoremap('j', '<C-R>')

-- Insert Keys
anoremap('k', 'i')
anoremap('K', 'I')

-- Copy and Paste
nnoremap('Y', 'y$')

-- Indentation
nnoremap('<', '<<')
nnoremap('>', '>>')
noremap('v','<', '<gv')
noremap('v','>', '>gv')

-- Folding
anoremap('<Leader>o', 'za')

-- Buffer Navigation
anoremap('<Leader><Left>', ':bp<CR>')
anoremap('<Leader><Right>', ':bn<CR')

-- Cursor Movement

-- New cursor movement (the default arrow keys are used for resizing windows)
--     ^
--     u
-- < n   i >
--     e
--     v
anoremap('u', 'k')
anoremap('n', 'h')
anoremap('e', 'j')
anoremap('i', 'l')
anoremap('gu', 'gk')
anoremap('ge', 'gj')

-- U/E keys for 5 times u/e (faster navigation)
anoremap('U', '5k')
anoremap('E', '5j')

-- N key: go to the start of the line
anoremap('N', '0')
-- I key: go to the end of the line
anoremap('I', '$')

-- Faster in-line navigation
anoremap('W', '5w')
anoremap('B', '5b')

-- Set h (same as n, cursor left) to 'end of word'
anoremap('h', 'e')

-- Ctrl + U or E will move up/down the view port without moving the cursor
anoremap('<C-U>', '5<C-y>')
anoremap('<C-E>', '5<C-e>')

-- Delete
nnoremap('<leader>d', '"_d')
noremap('x','<leader>d', '"_d')
noremap('x','<leader>p', '"_dP')

-- Insert Mode Cursor Movement
noremap('i','<C-a>', '<Esc>A')
noremap('i','<C-n>', '<Esc>N')


-- Searching
nnoremap('-', 'N')
nnoremap('=', 'n')


-- Window management
-- Use <space> + new arrow keys for moving the cursor around windows
anoremap('<Leader>w', '<C-w>w')
anoremap('<Leader>u', '<C-w>k')
anoremap('<Leader>e', '<C-w>j')
anoremap('<Leader>n', '<C-w>h')
anoremap('<Leader>i', '<C-w>l')

-- Disable the default s key
anoremap('s', '<nop>')

-- Split the screens up (horizontal), down (horizontal), left (vertical), right (vertical)
anoremap('su', ':set nosplitbelow<CR>:split<CR>:set splitbelow<CR>')
anoremap('se', ':set splitbelow<CR>:split<CR>')
anoremap('sn', ':set nosplitright<CR>:vsplit<CR>:set splitright<CR>')
anoremap('si', ':set splitright<CR>:vsplit<CR>')

-- Resize splits with arrow keys
anoremap('<up>', ':res +5<CR>')
anoremap('<down>', ':res -5<CR>')
anoremap('<left>', ':vertical resize+5<CR>')
anoremap('<right>', ':vertical resize-5<CR>')

-- Place the two screens up and down
anoremap('sh', '<C-w>t<C-w>K')
-- Place the two screens side by side
anoremap('sv', '<C-w>t<C-w>H')

-- Rotate screens
anoremap('srh', '<C-w>b<C-w>K')
anoremap('srv', '<C-w>b<C-w>H')

-- Change window to tab
anoremap('st', '<C-w>T')

-- Tab management
-- Create a new tab with tu
anoremap('tu', ':tabe<CR>')
-- Move around tabs with tn and ti
anoremap('tn', ':-tabnext<CR>')
anoremap('ti', ':+tabnext<CR>')
-- Move the tabs with tmn and tmi
anoremap('tmn', ':-tabmove<CR>')
anoremap('tmi', ':+tabmove<CR>')

-- Other useful stuff

-- Opening a terminal window
anoremap('<Leader>/', ':set splitright<CR>:vsplit<CR>:term<CR>')
-- Closing a terminal window
noremap('t','<ESC>', '<C-\\><C-n>')

-- Set relative number
anoremap('<Leader>sr', ':set relativenumber!<CR>')

-- Spelling Check with <space>sc
anoremap('<Leader>sc', ':set spell!<CR>')
anoremap('<Leader>zz', '1z=')

-- Press ` to change case (instead of ~)
anoremap('`', '~')

-- Control+S to save and quit
anoremap('<C-s>', 'ZZ')

-- Find and replace
anoremap('<Leader>R', ':%s//<left>')
noremap('x','<Leader>R', ':s//<left>')
anoremap('<Leader>F', '/')

-- Remap :noh to <leader>h
anoremap('<Leader>h', ':noh<CR>')

-- Screen movement
anoremap('L', 'H')
anoremap('M', 'L')
anoremap('H', 'M')

-----------------------
-- Code Runner
vim.api.nvim_set_keymap('n', '<Leader>rr', [[:lua Run()<CR>]], { noremap = true, silent = true })

function Run()
  vim.cmd('w')
  local filetype = vim.bo.filetype
  if filetype == 'c' then
    vim.fn.system('!g++-12 % -o %<')
    vim.fn.system('!time ./%<')
  elseif filetype == 'cpp' then
    vim.cmd('set splitbelow')
    vim.fn.system('!g++-12 -std=c++11 % -Wall -o %<')
    vim.cmd('sp')
    vim.cmd('term ./%<')
  elseif filetype == 'java' then
    vim.cmd('set splitbelow')
    vim.cmd('sp')
    if vim.fn.has('win32') then
      vim.cmd('term javac % ; java %')
    else
      vim.cmd('term javac % && java %')
    end
  elseif filetype == 'sh' then
    vim.fn.system('!time bash %')
  elseif filetype == 'python' then
    vim.cmd('set splitbelow')
    vim.cmd('sp')
    vim.cmd('term python %')
  elseif filetype == 'html' then
    local mkdp_browser = vim.g.mkdp_browser
    vim.fn.system(string.format('!%s % &', mkdp_browser))
  elseif filetype == 'markdown' then
    vim.cmd('MarkdownPreviewToggle')
  elseif filetype == 'tex' then
		vim.cmd('VimtexCompile')
  elseif filetype == 'javascript' then
    vim.cmd('set splitbelow')
    vim.cmd('sp')
    vim.cmd('term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .')
  elseif filetype == 'go' then
    vim.cmd('set splitbelow')
    vim.cmd('sp')
    vim.cmd('term go run .')
  elseif filetype == 'ocaml' then
    vim.cmd('set splitbelow')
    vim.cmd('sp')
    vim.fn.system('make all && clear && make run')
  end
end

-----------------------

-- Plugin Manager
-- Install lazy.nvim if not already
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    {"dracula/vim", name = 'dracula'},
    {"iamcco/markdown-preview.nvim", build = 'cd app && yarn install', ft = 'markdown'},
    {"preservim/nerdtree", init = function()
        vim.g.NERDCreateDefaultMappings = 0
        vim.g.NERDTreeMenuUp = 'u'
        vim.g.NERDTreeMenuDown = 'e'
        vim.g.NERDTreeMapUpdir = 'a'
        vim.g.NERDTreeMapOpenExpl = 'f'
        vim.g.NERDTreeMapUpdirKeepOpen = 'F'
        vim.g.NERDTreeMapChangeRoot = 'r'
        vim.g.NERDTreeMapRefresh = 'C'
      end,
    },
    {"Xuyuanp/nerdtree-git-plugin"},
    {"tpope/vim-surround"},
    {"itchyny/lightline.vim", init = function()
        vim.g.lightline = {
          colorscheme = 'wombat',
          active = {
            left = {
              { 'mode', 'paste' },
              { 'readonly', 'filename', 'modified', 'helloworld' }
            }
          }
        }
      end,
    },
    {"luochen1990/rainbow", init = function()
        vim.g.rainbow_active = 1
      end,
    },
    {"scrooloose/nerdcommenter"},
    {"MaxMEllon/vim-jsx-pretty", ft = {"javascript", "typescript", "javascriptreact", "typescriptreact"}},
    {"pangloss/vim-javascript", ft = {"javascript", "typescript", "javascriptreact", "typescriptreact"}},
    {"ryanoasis/vim-devicons"},
    {"lervag/vimtex", ft = "tex", init = function()
        vim.g.tex_flavor = 'latex'
        vim.g.vimtex_view_method = 'skim'
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1
      end,
    },
    {"github/copilot.vim", init = function()
				vim.g.copilot_no_tab_map = true
				vim.g.copilot_assume_mapped = true
				vim.g.copilot_tab_fallback = ""
				vim.api.nvim_set_keymap("i", "<C-Enter>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
			end,
		},
    {"ap/vim-css-color", ft = {"css", "scss", "sass", "less"}},
    {"nvim-lua/plenary.nvim"},
    {"nvim-telescope/telescope.nvim"},
    {"ctrlpvim/ctrlp.vim"},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
		{'neovim/nvim-lspconfig'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/nvim-cmp'},
		{'L3MON4D3/LuaSnip'},
		{"williamboman/mason.nvim"},
		{"williamboman/mason-lspconfig.nvim"},
})

----------------------------------------
-- Plugin Configuration

-- Copilot
-- Quickly enable and disable Copilot
nnoremap('<leader>gC', [[:lua require'copilot'.enable()<CR>]])
nnoremap('<leader>gc', [[:lua require'copilot'.disable()<CR>]])

-- Telescope
-- Find files using Telescope command-line sugar.
nnoremap('<leader>ff', [[:Telescope find_files<CR>]])
nnoremap('<leader>fg', [[:Telescope live_grep<CR>]])
nnoremap('<leader>fb', [[:Telescope buffers<CR>]])
nnoremap('<leader>fh', [[:Telescope help_tags<CR>]])
nnoremap('<leader>fz', [[:Telescope spell_suggest<CR>]])
anoremap('<Leader><CR>', [[:CtrlPMixed<CR>]])

-- Latex
anoremap('<LEADER>L', [[:VimtexTocToggle<CR>]])
anoremap('<LEADER>v', [[:VimtexView<CR>]])

function write_server_name()
  local nvim_server_file = (vim.fn.has('win32') and os.getenv('TEMP') or '/tmp') .. '/vimtexserver.txt'
  vim.fn.writefile({vim.fn.serverstart()}, nvim_server_file)
end

vim.api.nvim_exec([[
augroup vimtex_common
  autocmd!
  autocmd FileType tex lua write_server_name()
augroup END
]], true)


-- Language support
vim.cmd([[
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
]])

-- Comments
map('v','<LEADER>a', [[<plug>NERDCommenterToggle]])
nmap('<LEADER>a', [[<plug>NERDCommenterToggle]])


-- Toggle NERDTree
anoremap('<LEADER>t', [[:NERDTreeToggle<CR>]])


vim.cmd('colorscheme dracula')

------------------------------------
-- LSP
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
	vim.keymap.set('n', 'T', '<cmd>lua vim.lsp.buf.hover()<CR>', {buffer = bufnr})
	vim.keymap.set('n', '<LEADER>rn',	'<cmd>lua vim.lsp.buf.rename()<CR>', {buffer = bufnr})
	vim.keymap.set('n', '<LEADER>ca',	'<cmd>lua vim.lsp.buf.code_action()<CR>', {buffer = bufnr})
end)

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
		['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
  }),
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert',
	},
	window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
})

--- Language Servers Managed by Mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require('mason-lspconfig').setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
	},
})


--- Language Servers Managed by LSPConfig
local lspconfig = require('lspconfig')

lspconfig.ocamllsp.setup({
	cmd = {"ocamllsp", "--fallback-read-dot-merlin"},
	capabilities = capabilities,
})
