-- Default providers
vim.g.python3_host_prog = '/opt/homebrew/bin/python'

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
vim.opt.autoread = true
-- trigger autoread on buffer change au FocusGained,BufEnter * checktime
vim.opt.autoread = true
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
-- fold all
anoremap('<Leader>O', 'zM')
-- unfold all
anoremap('<Leader>U', 'zR')

-- close all buffers except current
 anoremap('<Leader>Q', ':w | %bd | e#<CR><CR>')


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

-- Delete w/out yanking
nnoremap('<leader>d', '"_d')
noremap('x','<leader>d', '"_d')
noremap('x','<leader>p', '"_dP')

-- Insert Mode Cursor Movement
noremap('i','<C-i>', '<Esc>A')
noremap('i','<C-n>', '<Esc>0')

-- Searching
nnoremap('-', 'N')
nnoremap('=', 'n')
nnoremap('<Esc>', ':noh<CR>')

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

-- Place the two screens up and down
anoremap('sh', '<C-w>t<C-w>K')
-- Place the two screens side by side
anoremap('sv', '<C-w>t<C-w>H')

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
anoremap('<Leader>/', ':set splitbelow<CR>:split<CR>:execute "resize".(winheight(0)/2)<CR>:term<CR>')
-- split to right then open terminal then insert mode, type gemini then hit enter
anoremap('<Leader>g', ':vsplit<CR>:execute "vertical resize".(winwidth(0)* 5/6)<CR>:term gemini<CR>')
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Set relative number
anoremap('<Leader>sr', ':set relativenumber!<CR>')

-- Spelling Check with <space>sc
anoremap('<Leader>sc', ':set spell!<CR>')
anoremap('<Leader>zz', '1z=')

-- Press ` to change case (instead of ~)
anoremap('`', '~')

-- Find and replace
anoremap('<Leader>H', ':%s//<left>')
noremap('x','<Leader>H', ':s//<left>')
anoremap('<Leader>F', '/')

-- Remap :noh to <leader>h
anoremap('<Leader>h', ':noh<CR>')

-- Screen movement
anoremap('L', 'H')
anoremap('M', 'L')
anoremap('H', 'M')


-- Buffer Management
noremap('n','<Tab>', '<C-i>')
noremap('n','<Bs>', '<C-o>')

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
    {"catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {"iamcco/markdown-preview.nvim", build = 'cd app && yarn install', ft = 'markdown'},
    {"preservim/nerdtree", init = function()
        vim.g.NERDCreateDefaultMappings = 0
				vim.g.NERDTreeShowHidden = 1
        vim.g.NERDTreeMenuUp = 'u'
        vim.g.NERDTreeMenuDown = 'e'
        vim.g.NERDTreeMapUpdir = 'a'
        vim.g.NERDTreeMapOpenExpl = 'f'
        vim.g.NERDTreeMapUpdirKeepOpen = 'F'
        vim.g.NERDTreeMapChangeRoot = 'c'
        vim.g.NERDTreeMapRefresh = 'R'
				vim.g.NERDTreeIgnore = {'.DS_Store'}
      end,
    },
    {"itchyny/lightline.vim", init = function()
        vim.g.lightline = {
          colorscheme = 'wombat',
          active = {
            left = {
              { 'mode', 'paste' },
              { 'readonly', 'filename', 'modified'}
            }
          }
        }
      end,
    },
    {"luochen1990/rainbow", init = function()
        vim.g.rainbow_active = 1
      end,
    },
		{"sindrets/diffview.nvim"},
		{"elihunter173/dirbuf.nvim"},
		{"scrooloose/nerdcommenter"},
		{
			"echasnovski/mini.icons",
			opts = {},
			lazy = true,
			specs = {
				{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
			},
			init = function()
				package.preload["nvim-web-devicons"] = function()
					require("mini.icons").mock_nvim_web_devicons()
					return package.loaded["nvim-web-devicons"]
				end
			end,
		},
    {"lervag/vimtex", ft = "tex", init = function()
        vim.g.tex_flavor = 'latex'
        vim.g.vimtex_view_method = 'skim'
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1
      end,
    },
		{
  "Exafunction/codeium.vim",
  config = function ()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-Enter>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
		vim.keymap.set('i', '<C-=>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-->', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  end
},
    {"ap/vim-css-color", ft = {"css", "scss", "sass", "less"}},
    {"nvim-lua/plenary.nvim"},
    {"nvim-telescope/telescope.nvim"},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {"williamboman/mason-lspconfig.nvim"},
    {"nvim-lua/plenary.nvim"},
    {'stevearc/conform.nvim', opts = {}},
    {"L3MON4D3/LuaSnip", version = "v2.*",build = "make install_jsregexp"},
    {'williamboman/mason.nvim',
      opts = {
        registries = {
          'github:mason-org/mason-registry',
        }
      },
    },
    {"MaxMEllon/vim-jsx-pretty", ft = {"javascript", "javascriptreact", "typescript", "typescriptreact"}},
    {"CRAG666/code_runner.nvim", config = true},
		{"LudoPinelli/comment-box.nvim"},
		{'mrjones2014/smart-splits.nvim'},
		{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
})

----------------------------------------
-- Plugin Configuration

-- Telescope
-- Find files using Telescope command-line sugar.
-- Command pallet like functionality
require('telescope').setup({
	pickers = {
		find_files = {
			hidden = true
		}
	}
})

nnoremap('<leader><leader>', [[:Telescope commands<CR>]])
nnoremap('<leader>ff', [[:Telescope current_buffer_fuzzy_find<CR>]])
nnoremap('<leader>fF', [[:Telescope live_grep search_dirs=./<CR>]])
nnoremap('<leader>fr', [[:Telescope lsp_references<CR>]])
nnoremap('<leader>fz', [[:Telescope spell_suggest<CR>]])
nnoremap('<leader>fb', [[:Telescope buffers<CR>]])
nnoremap('<leader>fg', [[:Telescope git_status<CR>]])
anoremap('<Leader><CR>', [[:Telescope fd<CR>]])

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


-- Colour scheme
vim.cmd('colorscheme catppuccin-mocha')

------------------------------------
-- syntax highlighting
require('nvim-treesitter.configs').setup({
  ensure_installed = { "c", "typescript" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    disable = {},
  },
})
-- LSP
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
	vim.keymap.set('n', 'T', '<cmd>lua vim.lsp.buf.hover()<CR>', {buffer = bufnr})
	vim.keymap.set('n',	'<LEADER>dd',	':lua vim.diagnostic.open_float(0, {scope="line"})<CR>', {buffer = bufnr})
	vim.keymap.set('n', '<LEADER>rn',	'<cmd>lua vim.lsp.buf.rename()<CR>', {buffer = bufnr})
	vim.keymap.set('n',	'<LEADER>gd',	'<cmd>lua vim.lsp.buf.definition()<CR>', {buffer = bufnr})
	vim.keymap.set('n',	'<LEADER>gi',	'<cmd>lua vim.lsp.buf.implementation()<CR>', {buffer = bufnr})
	vim.keymap.set('n', '<LEADER>ca',	'<cmd>lua vim.lsp.buf.code_action()<CR>', {buffer = bufnr})
end)

vim.diagnostic.config({virtual_text = false})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

-- Autocomplete

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
		['<Tab>'] = cmp_action.tab_complete(),
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

-- Formatter Managed by conform.nvim
require("conform").setup({
    formatters_by_ft = {
        python = { "isort", "black" },
				go = { "gofmt" },
				-- everything that uses Prettier
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				sass = { "prettier" },
				less = { "prettier" },
				markdown = { "prettier" },
				},

				format_on_save = {
						timeout_ms = 500,
						lsp_fallback = false,
					},
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
	handlers = {
		lsp_zero.default_setup,
	},
})


 --Coderunner settings
-- Remap leader rr to run code
vim.api.nvim_set_keymap('n', '<LEADER>rr', ':RunCode<CR>', { noremap = true, silent = true })

require('code_runner').setup({
  filetype = {
    python = "python3 -u",
    typescript = "",
  },
})


--- Language Servers Managed by LSPConfig
local lspconfig = require('lspconfig')


--- LuaSnip Setup
local ls = require("luasnip")

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

--- Smart Splits
vim.keymap.set('n', '<left>', require('smart-splits').resize_left)
vim.keymap.set('n', '<down>', require('smart-splits').resize_down)
vim.keymap.set('n', '<up>', require('smart-splits').resize_up)
vim.keymap.set('n', '<right>', require('smart-splits').resize_right)
