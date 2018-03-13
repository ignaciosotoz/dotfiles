set nocompatible
set encoding=utf8
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'chrisbra/csv.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bufexplorer.zip'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jalvesaq/Nvim-R'
Plugin 'edkolev/tmuxline.vim'
Plugin 'honza/vim-snippets'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/Align'
Plugin 'ayu-theme/ayu-vim'
Plugin 'garbas/vim-snipmate'
Plugin 'Yggdroot/indentLine'
Plugin 'davidhalter/jedi-vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'ervandew/supertab'
Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-scripts/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'danilo-augusto/vim-afterglow'
Plugin 'ryanoasis/vim-devicons'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'vim-scripts/R-syntax-highlighting'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mhinz/vim-startify'        
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'arcticicestudio/nord-vim'
Plugin 'slim-template/vim-slim'

call vundle#end()
filetype plugin indent on
filetype plugin on
syntax on

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set modifiable
set wildmenu

colorscheme nord


set number
" set relativenumber
set noswapfile 
set tabstop=4
set softtabstop=1
set shiftwidth=4
set noexpandtab
set guifont=InconsolataForPowerline\ Nerd\ Font:h18

" R assign keymap
let R_assign = 2
" R do not indent commented
let R_indent_commented = 0
" R open Object Browser on top of Console, 10 lines height
let R_objbr_place = "console,top"
let R_objbr_w=10
let R_objbr_opendf =1
set backspace=indent,eol,start

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = ['lintr']

nmap <leader>sc :SyntasticCheck<CR>
nmap <leader>st :SyntasticToggleMode<CR>

" Airline presets
" let g:airline_theme='murmur'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:javascript_plugin_flow = 1

" Indent lines
" let g:indent_guides_enable_on_vim_startup = 1

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden


" Markdown presets
let g:vim_markdown_fenced_languages = ['ruby=rb', 'python=py', 'r=r', 'javascript=js', 'julia=jl', 'bash=sh']
set conceallevel=2
let g:vim_markdown_math = 1


" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR

" indent
let g:indentLine_setColor = 0
let g:indentLine_char = '|'

" auto close parentheses, brackets, and curly brackets
let g:AutoPairsFlyMode = 1

" Syntactic conif

set statusline+=%#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint']

set cursorline



let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" Recognize julia files

autocmd BufRead,BufNewFile *.jl :set filetype=julia


" R icon for devicons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = 'ℝ'



" Startify
let g:ascii = [
  \ '  A_A',
  \ ' (-.-) ',
  \ '  |-|  ',
  \ ' /   \',
  \ '|     |   __  ',
  \ '| | | |  |  \__',
  \ '\o|_|o/_/ ', 
  \ ]

let g:startify_custom_header = g:ascii + startify#fortune#boxed()

let g:startify_list_order = [
  \ ['   MRU'],
  \ 'files',
  \ ['	 MRU in the current directory:'],
  \ 'dir',
  \ ['   These are my sessions:'],
  \ 'sessions',
  \ ['   These are my bookmarks:'],
  \ 'bookmarks',
  \ ['   These are my commands:'],
  \ 'commands',
  \ ]


let g:startify_commands = [
  \ ':help references',
  \ ['Vim reference', 'h ref'],
  \ {'h': 'h ref'},
  \ {'s': ['Open scratch pad', 'e scratch.md' ]},
  \]


