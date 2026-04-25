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
vim.opt.listchars = { tab = '▸ ', trail = '·', nbsp = '␣', extends = '»', precedes
  = '«' }
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
vim.opt.laststatus = 3
vim.opt.iskeyword:remove('_')
vim.opt.clipboard = 'unnamedplus'

-- Auto-reload files when they change externally
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	command = "checktime",
})

-- Clear jumplist on startup (don't persist across sessions)
vim.api.nvim_create_autocmd('VimEnter', {
	callback = function() vim.cmd('clearjumps') end,
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
vim.keymap.set('t', '<C-N>', '<C-\\><C-N>', { noremap = true })
vim.keymap.set('t', '<C-O>', '<C-\\><C-N><C-O>', { noremap = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', { noremap = true })

-- Set <LEADER> as <SPACE>
vim.g.mapleader = ' '

-- Key Mappings
local opts = { noremap = true, silent = true }
local remap_opts = { noremap = true }

-- ; as :
vim.keymap.set({ 'n', 'v' }, ';', ':', remap_opts)

-- Save and Quit
vim.keymap.set({ 'n', 'v' }, 'Q', ':q<CR>', opts)
vim.keymap.set({ 'n', 'v' }, '<C-q>', ':qa<CR>', opts)
vim.keymap.set({ 'n', 'v' }, 'S', ':w<CR>', opts)

-- Undo and Redo
vim.keymap.set({ 'n', 'v' }, 'l', 'u', opts)
vim.keymap.set({ 'n', 'v' }, 'j', '<C-R>', opts)

-- Insert Keys
vim.keymap.set({ 'n', 'v' }, 'k', 'i', opts)
vim.keymap.set({ 'n', 'v' }, 'K', 'I', opts)

-- Copy and Paste
vim.keymap.set('n', 'Y', 'y$', opts)

-- Indentation
vim.keymap.set('n', '<', '<<', opts)
vim.keymap.set('n', '>', '>>', opts)
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Folding
vim.keymap.set({ 'n', 'v' }, '<Leader>o', 'za', opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>O', 'zM', opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>U', 'zR', opts)

-- Buffer Management
vim.keymap.set({ 'n', 'v' }, '<Leader>Q', ':w | %bd | e#<CR><CR>', opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>q', ':bdelete<CR>', opts)
vim.keymap.set({ 'n', 'v' }, '[[', ':bprevious<CR>', { noremap = true, silent = true, nowait = true })
vim.keymap.set({ 'n', 'v' }, ']]', ':bnext<CR>', { noremap = true, silent = true, nowait = true })

-- Cursor Movement (Colemak-style)
vim.keymap.set({ 'n', 'v' }, 'u', 'k', opts)
vim.keymap.set({ 'n', 'v' }, 'n', 'h', opts)
vim.keymap.set({ 'n', 'v' }, 'e', 'j', opts)
vim.keymap.set({ 'n', 'v' }, 'i', 'l', opts)
vim.keymap.set({ 'n', 'v' }, 'gu', 'gk', opts)
vim.keymap.set({ 'n', 'v' }, 'ge', 'gj', opts)

-- U/E keys for 5 times u/e (faster navigation)
vim.keymap.set({ 'n', 'v' }, 'U', '5k', opts)
vim.keymap.set({ 'n', 'v' }, 'E', '5j', opts)

-- N key: go to the start of the line, I key: go to the end of the line
vim.keymap.set({ 'n', 'v' }, 'N', '0', opts)
vim.keymap.set({ 'n', 'v' }, 'I', '$', opts)

-- Faster in-line navigation
vim.keymap.set({ 'n', 'v' }, 'W', '5w', opts)
vim.keymap.set({ 'n', 'v' }, 'B', '5b', opts)

-- Jumplist navigation (skip nvim-tree buffers and the starting buffer)
local function jump_skip_nvimtree(key)
  local termcode = vim.api.nvim_replace_termcodes(key, true, false, true)
  return function()
    local start_buf = vim.api.nvim_get_current_buf()
    for _ = 1, 100 do
      local prev_buf = vim.api.nvim_get_current_buf()
      local prev_line = vim.api.nvim_win_get_cursor(0)[1]
      vim.api.nvim_feedkeys(termcode, 'nx', false)
      local cur_buf = vim.api.nvim_get_current_buf()
      local cur_line = vim.api.nvim_win_get_cursor(0)[1]
      -- jumplist exhausted: cursor didn't move
      if cur_buf == prev_buf and cur_line == prev_line then return end
      local ft = vim.bo[cur_buf].filetype
      local name = vim.api.nvim_buf_get_name(cur_buf)
      local is_nvimtree = ft == 'NvimTree' or name:match('NvimTree_') ~= nil
      -- stop when we land in a buffer that is not the starting one and not nvim-tree
      if cur_buf ~= start_buf and not is_nvimtree then return end
    end
  end
end
vim.keymap.set('n', '<Tab>', jump_skip_nvimtree('<C-i>'), opts)
vim.keymap.set('n', '<BS>', jump_skip_nvimtree('<C-o>'), opts)

-- Delete w/out yanking
vim.keymap.set('n', '<leader>d', '"_d', opts)
vim.keymap.set('x', '<leader>d', '"_d', opts)
vim.keymap.set('x', '<leader>p', '"_dP', opts)

-- Searching
vim.keymap.set('n', '-', 'N', opts)
vim.keymap.set('n', '=', 'n', opts)
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

-- Window management
vim.keymap.set({ 'n', 'v' }, '<Leader>w', '<C-w>w', opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>u', '<C-w>k', opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>e', '<C-w>j', opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>n', '<C-w>h', opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>i', '<C-w>l', opts)

-- Disable the default s key
vim.keymap.set({ 'n', 'v' }, 's', '<nop>', opts)

-- Split the screens
vim.keymap.set({ 'n', 'v' }, 'su', ':set nosplitbelow<CR>:split<CR>:set splitbelow<CR>', opts)
vim.keymap.set({ 'n', 'v' }, 'se', ':set splitbelow<CR>:split<CR>', opts)
vim.keymap.set({ 'n', 'v' }, 'sn', ':set nosplitright<CR>:vsplit<CR>:set splitright<CR>', opts)
vim.keymap.set({ 'n', 'v' }, 'si', ':set splitright<CR>:vsplit<CR>', opts)

-- Place the two screens up and down / side by side
vim.keymap.set({ 'n', 'v' }, 'sh', '<C-w>t<C-w>K', opts)
vim.keymap.set({ 'n', 'v' }, 'sv', '<C-w>t<C-w>H', opts)

-- Change window to tab
vim.keymap.set({ 'n', 'v' }, 'st', '<C-w>T', opts)

-- Tab management
vim.keymap.set({ 'n', 'v' }, 'tu', ':tabnew<CR>', opts)
vim.keymap.set({ 'n', 'v' }, 'tn', ':-tabnext<CR>', opts)
vim.keymap.set({ 'n', 'v' }, 'ti', ':+tabnext<CR>', opts)
vim.keymap.set({ 'n', 'v' }, 'tmn', ':-tabmove<CR>', opts)
vim.keymap.set({ 'n', 'v' }, 'tmi', ':+tabmove<CR>', opts)

-- Terminal
vim.keymap.set({ 'n', 'v' }, '<Leader>/', ':set splitbelow<CR>:split<CR>:execute "resize".(winheight(0)/2)<CR>:term<CR>', opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>\\',':set nosplitright<CR>:vsplit<CR>:set splitright<CR>:execute "vertical resize " .. float2nr(&columns * 0.3)<CR>:term<CR>',opts)

-- Utilities
vim.keymap.set({ 'n', 'v' }, '<Leader>sr', ':set relativenumber!<CR>', opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>sc', ':set spell!<CR>', opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>zz', '1z=', opts)
vim.keymap.set({ 'n', 'v' }, '`', '~', opts)

-- Find and replace
vim.keymap.set({ 'n', 'v' }, '<Leader>H', ':%s//<left>', remap_opts)
vim.keymap.set('x', '<Leader>H', ':s//<left>', remap_opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>F', '/', opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>h', ':noh<CR>', opts)

-- Screen movement
vim.keymap.set({ 'n', 'v' }, 'L', 'H', opts)
vim.keymap.set({ 'n', 'v' }, 'M', 'L', opts)
vim.keymap.set({ 'n', 'v' }, 'H', 'M', opts)

-- Viewport movement 
vim.keymap.set({ 'n', 'v' }, '<C-y>', '<nop>', opts)
vim.keymap.set({ 'n', 'v' }, '<C-e>', '<nop>', opts)
vim.keymap.set({ 'n', 'v' }, '<C-U>', '5<C-y>', opts)
vim.keymap.set({ 'n', 'v' }, '<C-E>', '5<C-e>', opts)

-- Insert mode begin and end of line
vim.keymap.set('i', '<C-n>', '<C-o>0', opts)
vim.keymap.set('i', '<C-i>', '<C-o>$', opts)

-- Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Colorscheme
  {
    "catppuccin/nvim", 
    name = "catppuccin", 
    config = function()
      vim.cmd('colorscheme catppuccin-mocha')
    end
  },
	{"vague-theme/vague.nvim",  
    name = "vague", 
    priority = 1000,
	},
  -- File explorer, load on startup
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		priority = 1000,
		dependencies = {
			"echasnovski/mini.icons",
		},
		init = function()
			require("mini.icons").setup()
			require("mini.icons").mock_nvim_web_devicons()
		end,
		opts = {
			filters = {
				dotfiles = false,
				custom = { ".DS_Store" },
			},
			hijack_netrw = true,
			disable_netrw = true,
			hijack_cursor = true,
			sync_root_with_cwd = true,
			update_focused_file = { enable = true, update_root = false },
			actions = {
				open_file = {
					quit_on_open = false,
				},
			},

			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				api.config.mappings.default_on_attach(bufnr)
				api.update_to_buf_dir = { enable = false }
				local function map(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = bufnr, noremap = true, silent = true, nowait = true, desc = desc })
				end
				vim.keymap.set("n", "O", function()
					local node = api.tree.get_node_under_cursor()
					if node then
						vim.fn.jobstart({ "open", "-R", node.absolute_path }, { detach = true })
					end
				end, { buffer = bufnr, desc = "Reveal in Finder" })

				-- j → n (down), k → e (up) : use raw cursor movement
				map("e", "j", "Down", { remap = true })
				map("u", "k", "Up",   { remap = true })
				map("E", "5j", "Down", { remap = true })
				map("U", "5k", "Up",   { remap = true })
				map("R", api.tree.reload,"Refresh")
				map("[", api.tree.change_root_to_parent, "Up a directory")
				map("]", api.tree.change_root_to_node, "Set as root")
			end,
			view = {
				width = 34,
				side = "right",
				preserve_window_proportions = true,
			},
			renderer = {
				highlight_git = true,
				highlight_diagnostics = true,
				group_empty = true,
				icons = {
					show = {
						diagnostics = true,
					},
				},
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
				debounce_delay = 50,
				icons = {
					error = '✘',
					warning = '▲',
					hint = '⚑',
					info = '»'
				},
			},
		},
		keys = {
			{ "<leader>t", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
		},
	},
	-- Directory buffer
	{
		"elihunter173/dirbuf.nvim",
	},
  -- Status line
  {
    "itchyny/lightline.vim",
    event = "VeryLazy",
    init = function()
      vim.g.lightline = {
        colorscheme = 'wombat',
        active = {
          left = {
            { 'mode', 'paste' },
            { 'readonly', 'filename', 'modified'}
          },
          right = {
            { 'lineinfo' },
            { 'percent' },
            { 'fileformat', 'fileencoding', 'filetype' },
          }
        },
      }
    end,
  },
  -- Syntax highlighting and parsing (nvim-treesitter main branch — Neovim 0.11+ rewrite)
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local ensure = { 'c', 'lua', 'python', 'javascript', 'typescript', 'tsx', 'markdown', 'markdown_inline', 'vim', 'vimdoc', 'query', 'bash', 'json', 'yaml', 'html', 'css' }
      require('nvim-treesitter').install(ensure)

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
          if lang and pcall(vim.treesitter.start, args.buf, lang) then
            vim.bo[args.buf].syntax = 'on'
          end
        end,
      })
    end,
  },

  -- Rainbow delimiters
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      vim.g.rainbow_delimiters = {
        condition = function(bufnr)
          local ft = vim.bo[bufnr].filetype
          local lang = vim.treesitter.language.get_lang(ft)
          if not lang then return false end
          local ok, parser = pcall(vim.treesitter.get_parser, bufnr, lang)
          return ok and parser ~= nil
        end,
      }
    end,
  },

  -- Git diff view
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  },

  -- Comments
  {
		"scrooloose/nerdcommenter",
    keys = {
      { "<Leader>a", "<plug>NERDCommenterToggle", mode = { "n", "v" }, desc = "Toggle comment" },
      { "<Leader>A", "<plug>NERDCommenterSexy", mode = { "n", "v" }, desc = "Sexy comment" },
    },
  },

  -- Icons
  {
    "echasnovski/mini.icons",
    opts = {},
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = true, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },
  -- LaTeX support
  {
    "lervag/vimtex",
    ft = "tex",
    keys = {
      { "<Leader>L", ":VimtexTocToggle<CR>", desc = "Toggle LaTeX TOC" },
      { "<Leader>v", ":VimtexView<CR>", desc = "View LaTeX" },
    },
    init = function()
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_view_method = 'skim'
      vim.g.vimtex_view_skim_sync = 1
      vim.g.vimtex_view_skim_activate = 1
    end,
    config = function()
      local function write_server_name()
        local nvim_server_file = (vim.fn.has('win32') == 1 and os.getenv('TEMP') or '/tmp') .. '/vimtexserver.txt'
        vim.fn.writefile({vim.fn.serverstart()}, nvim_server_file)
      end

      vim.api.nvim_create_augroup('vimtex_common', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        group = 'vimtex_common',
        pattern = 'tex',
        callback = write_server_name,
      })
    end,
  },
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = 'cd app && yarn install',
    ft = 'markdown',
  },

  -- CSS color preview
  {
    "ap/vim-css-color",
    ft = {"css", "scss", "sass", "less"},
  },
  -- fff.nvim: fast file finder + live grep
  {
    "dmtrKovalenko/fff.nvim",
    build = function()
      require("fff.download").download_or_build_binary()
    end,
    lazy = false,
    keys = {
      { "<Leader><CR>", function() require('fff').find_files() end, desc = "Find files" },
      { "<leader>fF", function() require('fff').live_grep({ grep = { modes = { 'fuzzy', 'plain' } } }) end, desc = "Live grep" },
    },
    opts = {},
  },
  -- Telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader><leader>", ":Telescope commands<CR>", desc = "Command palette" },
      { "<leader>ff", ":Telescope current_buffer_fuzzy_find<CR>", desc = "Fuzzy find in buffer" },
      { "<leader>fd", ":Telescope diagnostics<CR>", desc = "List diagnostics" },
      { "<leader>fr", ":Telescope lsp_references<CR>", desc = "LSP references" },
      { "<leader>fz", ":Telescope spell_suggest<CR>", desc = "Spell suggestions" },
      { "<leader>fb", ":Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>fg", ":Telescope git_bcommits<CR>", desc = "Git commits" },
    },
    config = function()
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            "target",
            "build",
            "build/.*",
            "dist",
          }
        },
        pickers = {
          find_files = {
            hidden = true,
            no_ignore = true,
            no_ignore_parent = true,
            find_command = { 
              "rg", "--files", "--hidden", "--glob", "!.git/*", 
              "--glob", "!node_modules/*", "--glob", "!target/*", 
              "--glob", "!build/*", "--glob", "!dist/*"
            }
          }
        }
      })
    end,
  },
  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  -- Mason LSP server manager
  {
    'williamboman/mason.nvim',
    lazy = false,
    opts = {
      registries = {
        'github:mason-org/mason-registry',
      },
    },
  },
  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      local ls = require("luasnip")
      local config_path = vim.fn.stdpath("config")

      -- Load standard filetype snippets (e.g., snippets/python.lua, snippets/lua.lua)
      require("luasnip.loaders.from_lua").lazy_load({
        paths = { config_path .. "/snippets" }
      })

      -- Add config path to package.path for typst snippets
      package.path = config_path .. "/?.lua;" .. package.path

      -- Load typst snippets
      require("snippets.typst.math").setup({
        modules = { "autosnips", "matrices", "general" }
      })
      require("snippets.typst.general").setup({
        modules = { "general", "colors" }
      })

      -- Snippet navigation keymaps (always active)
      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true), "n", true)
        end
      end, { silent = true })
    end,
  },

{
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
},
  -- Autocompletion
{
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'L3MON4D3/LuaSnip' },
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = {
        { name = 'nvim_lsp', priority = 800 },
        { name = 'luasnip', priority = 750 },
        { name = 'cmp_r', priority = 700 },
        { name = 'buffer', priority = 500 },
        { name = 'path', priority = 300 },
      },
      formatting = {
        fields = { "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- Arrow keys: Navigate CMP menu
        ["<Down>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<Up>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        -- Enter: Always confirm CMP selection if visible
        ["<CR>"] = cmp.mapping({
          i = function(fallback)
            if cmp.visible() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
            else
              fallback()
            end
          end,
          s = cmp.mapping.confirm({ select = true }),
          c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
        -- Shift-Enter: Insert newline
        ["<S-CR>"] = cmp.mapping(function(fallback)
          fallback()
        end, { "i", "s" }),
        -- Ctrl-Space: Manually trigger completion
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      preselect = 'item',
      completion = { completeopt = 'menu,menuone,noinsert' },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

    })
    
    end,
  },
	-- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
				vim.keymap.set('n', 'T', function() vim.lsp.buf.hover() end, { buffer = bufnr })
        local diag_group = vim.api.nvim_create_augroup('DiagnosticHover_' .. bufnr, { clear = true })
        local diag_dismissed = false
        vim.api.nvim_create_autocmd('CursorMoved', {
          group = diag_group,
          buffer = bufnr,
          callback = function() diag_dismissed = false end,
        })
        vim.api.nvim_create_autocmd('CursorHold', {
          group = diag_group,
          buffer = bufnr,
          callback = function()
            if diag_dismissed then return end
            local _, winid = vim.diagnostic.open_float(nil, { focusable = false, scope = 'cursor' })
            if not winid then return end
            vim.keymap.set('n', 'q', function()
              diag_dismissed = true
              pcall(vim.api.nvim_win_close, winid, true)
              pcall(vim.keymap.del, 'n', 'q', { buffer = bufnr })
            end, { buffer = bufnr })
            vim.api.nvim_create_autocmd('WinClosed', {
              pattern = tostring(winid),
              once = true,
              callback = function()
                pcall(vim.keymap.del, 'n', 'q', { buffer = bufnr })
              end,
            })
          end,
        })
        vim.keymap.set('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {buffer = bufnr})
        vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {buffer = bufnr})
        vim.keymap.set('n', '<Leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {buffer = bufnr})
				vim.keymap.set("n", "<Leader>=", function() vim.diagnostic.jump({ count = 1, float = true }) end)
				vim.keymap.set("n", "<Leader>-", function() vim.diagnostic.jump({ count = -1, float = true }) end)
      end)
      vim.diagnostic.config({virtual_text = false})
      lsp_zero.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })

      require('mason-lspconfig').setup({
        handlers = {
          lsp_zero.default_setup,
        },
      })
    end
  },
  -- Formatter
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "ruff_format", "ruff_fix" },
          go = { "gofmt" },
          javascript = { "biome" },
          typescript = { "biome" },
          javascriptreact = { "biome" },
          typescriptreact = { "biome" },
          json = { "biome" },
          html = { "biome" },
          css = { "biome" },
          scss = { "biome" },
          sass = { "biome" },
          less = { "biome" },
          markdown = { "prettier" },
          typst = { "typstyle" },
        },
        format_on_save = {
          timeout_ms = 1000,
          lsp_format = "never",
        },
        notify_on_error = true,
      })
    end,
  },
  -- Smart splits for window resizing
  {
    'mrjones2014/smart-splits.nvim',
    keys = {
      { '<left>', function() require('smart-splits').resize_left() end, desc = "Resize left" },
      { '<down>', function() require('smart-splits').resize_down() end, desc = "Resize down" },
      { '<up>', function() require('smart-splits').resize_up() end, desc = "Resize up" },
      { '<right>', function() require('smart-splits').resize_right() end, desc = "Resize right" },
    },
  },
  -- GitHub Copilot LSP
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<Tab>",      -- Tab accepts Copilot suggestion
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          ["."] = false,
        },
      })
    end,
  },
})
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

local yank = require 'custom.yank'
-- Normal mode: yank file path
vim.keymap.set('n', '<leader>ya', function()
  yank.yank_path(yank.get_buffer_absolute(), 'absolute')
end, { desc = '[Y]ank [A]bsolute path to clipboard' })

vim.keymap.set('n', '<leader>yr', function()
  yank.yank_path(yank.get_buffer_cwd_relative(), 'relative')
end, { desc = '[Y]ank [R]elative path to clipboard' })

vim.keymap.set('x', '<leader>y', function()
  local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'nx', false)
  yank.yank_visual_with_path(yank.get_buffer_cwd_relative(), 'relative')
end, { silent = true, desc = '[Y]ank selection with [R]elative path' })


require 'custom.hotreload'
