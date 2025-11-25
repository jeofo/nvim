-- Set <LEADER> as <SPACE>
vim.g.mapleader = ' '

-- Terminal Behavior
vim.g.neoterm_autoscroll = 1
vim.cmd('autocmd TermOpen term://* startinsert')
vim.keymap.set('t', '<C-N>', '<C-\\><C-N>', { noremap = true })
vim.keymap.set('t', '<C-O>', '<C-\\><C-N><C-O>', { noremap = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', { noremap = true })

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
vim.keymap.set({ 'n', 'v' }, '[[', ':bprevious<CR>', opts)
vim.keymap.set({ 'n', 'v' }, ']]', ':bnext<CR>', opts)

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
vim.keymap.set({ 'n', 'v' }, '<Leader>\\',':set splitright<CR>:vsplit<CR>:execute "vertical resize " .. float2nr(&columns * 0.3)<CR>:term<CR>',opts)

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