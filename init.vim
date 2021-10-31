if has('win32')
	set shell=powershell
	set shellcmdflag=-command
	set shellquote=\"
	set shellxquote=
endif

source $HOME/.config/nvim/_machine_specific.vim
" ===
" === Editor behavior
" ===
set number
set cursorline
set hidden
set noexpandtab
set relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
set clipboard=unnamedplus


if has('unix')
	silent !mkdir -p $HOME/.config/nvim/tmp/backup
	silent !mkdir -p $HOME/.config/nvim/tmp/undo
endif

set backupdir=$HOME/.config/nvim/tmp/backup
set directory=$HOME/.config/nvim/tmp/backup

if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>

" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>

" Undo operations
noremap l u

" Insert Key
noremap k i
noremap K I

" make Y to copy till the end of the line
nnoremap Y y$

" Indentation
nnoremap < <<
nnoremap > >>

" Folding
noremap <silent> <LEADER>o za

 


" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l
noremap <silent> gu gk
noremap <silent> ge gj

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5k
noremap <silent> E 5j

" N key: go to the start of the line
noremap <silent> N 0
" I key: go to the end of the line
noremap <silent> I $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" set h (same as n, cursor left) to 'end of word'
noremap h e

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

" Delete
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A
inoremap <C-n> <ESC>N

" ===
" === Searching
" ===
noremap - N
noremap = n


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>i <C-w>l

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize+5<CR>
noremap <right> :vertical resize-5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Change window to tab
noremap st <C-w>T
" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>


" ===
" === Other useful stuff
" ===

" Opening a terminal window
noremap <LEADER>/ :set splitright<CR>:vsplit<CR>:term<CR>
" Closing a terminal window
tnoremap <Esc> <C-\><C-n>

" Set relative number
noremap <LEADER>sr :set relativenumber!<CR>

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~

" Control+S to save and quit
noremap <C-s> ZZ

" find and replace
noremap <LEADER>F :%s//<left>
noremap <LEADER>f /

" J for redo
noremap j <C-R>

" Clear Search
map <Esc> :noh<CR> 


" Compile function
noremap <silent>rr :call Run()<CR>
func! Run()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:term ./%<
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:term javac % && java %
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
endfunc


" ===
" === Install Plugins with Vim-Plug
" ===
call plug#begin('$HOME/.config/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
"Auto-Complete
Plug 'neoclide/coc.nvim'
"Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"Directory
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"Surround
Plug 'tpope/vim-surround'
"Status Line
Plug 'itchyny/lightline.vim'
"Rainbow
Plug 'luochen1990/rainbow'
"Fuzzy Search
Plug 'ctrlpvim/ctrlp.vim'
"Comments
Plug 'scrooloose/nerdcommenter'
"Language Support
Plug 'MaxMEllon/vim-jsx-pretty', {'for': ['javascript','typescript','javascriptreact','typescriptreact']}
Plug 'pangloss/vim-javascript',{'for': ['javascript','typescript','javascriptreact','typescriptreact']}
"Icons
Plug 'ryanoasis/vim-devicons'
call plug#end()


""" Plugin Configs
"Latex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
noremap <LEADER>L :VimtexTocOpen<CR>
"Rainbow
let g:rainbow_active = 1
"Language support
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
"Comments
let g:NERDCreateDefaultMappings = 0
vmap <LEADER>a <plug>NERDCommenterToggle
nmap <LEADER>a <plug>NERDCommenterToggle
"NERDTree
let NERDTreeMenuUp = 'u'
let NERDTreeMenuDown='e'
let NERDTreeMapUpdir = 'a'
let NERDTreeMapOpenExpl = 'f'
let NERDTreeMapUpdirKeepOpen = 'F'
" Toggle NERDTree
noremap <LEADER>t :NERDTreeToggle<CR>
"CtrlP
noremap <LEADER><CR> :CtrlPMixed<CR>
"Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ }
" ===
" === coc.nvim
" ===

let g:coc_global_extensions = [
	\ 'coc-pairs',
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-prettier',
	\ 'coc-eslint', 
	\ 'coc-pyright',
	\ 'coc-java',
	\ 'coc-syntax',
	\ 'coc-tsserver',
	\ 'coc-vimtex',
	\ 'coc-markdownlint',
	\ 'coc-vimtex',
	\ 'coc-flutter',
	\ 'coc-snippets']


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

nnoremap <LEADER>l :CocList<cr>
noremap <LEADER>c :CocCommand<CR>
nmap <LEADER>rn <Plug>(coc-rename)
nmap <leader><leader> <Plug>(coc-codeaction)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

colorscheme dracula
