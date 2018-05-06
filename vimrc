set nocompatible
set encoding=utf8
filetype off

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')


""" General Plugins {{{
Plug 'godlygeek/tabular'
Plug 'chrisbra/csv.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
Plug 'roxma/nvim-completion-manager'
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/Align'
Plug 'garbas/vim-snipmate'
Plug 'tomtom/tlib_vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vim-scripts/vim-addon-mw-utils'
Plug 'Yggdroot/indentLine'
Plug 'blueyed/vim-diminactive'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"""}}}

""" Language Specific Plugins {{{

" R
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'vim-scripts/R-syntax-highlighting'
Plug 'maverickg/stan.vim'

" Python
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'plytophogy/vim-virtualenv'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do' : 'UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
else
    Plug 'Shougo/neocomplete.vim'
endif

" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

Plug 'slim-template/vim-slim'
if has('nvim')
    Plug 'fishbullet/deoplete-ruby'
else
    Plug 'Shougo/neocomplete.vim'
endif

" Javascript
Plug 'pangloss/vim-javascript'

if has('nvim')
    Plug 'carlitux/deoplete-ternjs', { 'do' : 'npm install -g tern' }
else
    Plug 'Shougo/neocomplete.vim'
endif

" Markdown / LaTeX
Plug 'plasticboy/vim-markdown'
Plug 'lvht/tagbar-markdown'
Plug 'lervag/vimtex'

" Julia
Plug 'JuliaEditorSupport/julia-vim'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}
"""}}}


""" {{{ Coloschemes
Plug 'cocopon/iceberg.vim'
Plug 'rakr/vim-togglebg'
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline-themes/'
Plug 'mhartington/oceanic-next'
Plug 'vim-scripts/Zenburn'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
""" }}}

call plug#end()


""" General Settings {{{
filetype plugin indent on
filetype plugin on
syntax on
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set modifiable
set wildmenu
set number relativenumber
set noswapfile
set tabstop=2
set shiftwidth=4
set expandtab
" indent
let g:indentLine_char ="┆"
" auto close parentheses, brackets, and curly brackets
let g:AutoPairsFlyMode = 1
" highlight current line
set cursorline
" standarize backspace deletion
set backspace=indent,eol,start
" display warnings
set statusline+=%#warningmsg#
set statusline+=%
set hidden
" Split opening
set splitbelow
set splitright
" Show invisible characters
set listchars=tab:▒░,trail:▓,eol:•
" set snips authorship
let g:snips_author = "Ignacio Soto Zamorano"
let g:snips_email = "ignacio[dot]soto[dot]z[at]gmail[dot]com"
let g:snips_github = "https://github.com/ignaciosotoz"
" Reckon .jl extension
autocmd BufRead,BufNewFile *.jl :set filetype=julia
" Run deoplete
let g:deoplete#enable_at_startup = 1
let g:javascript_plugin_flow = 1
"""}}}


""" R {{{

" R assign keymap
let R_assign = 2
" R do not indent commented
let R_indent_commented = 0
" R open Object Browser on top of Console, 10 lines height
let R_objbr_place = "console,top"
let R_objbr_w=10
let R_objbr_opendf =1
" Extend tagbar to fetch R files. (depends on ~/.ctags)
let g:tagbar_type_r = {
            \ 'ctagstype' : 'r',
            \ 'kinds'     : [
            \ 'f:Functions',
            \ 'g:GlobalVariables',
            \ 'v:FunctionVariables',
            \ ]
            \ }
""" }}}

" Theme and Airline {{{
colorscheme gruvbox
set background=dark
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#enabled = 0
" }}}


" Markdown settings {{{
let g:vim_markdown_fenced_languages = ['ruby=rb', 'python=py', 'r=r', 'javascript=js', 'julia=jl', 'bash=sh']
set conceallevel=2
let g:vim_markdown_math = 1
" }}}


""" Mappings {{{

" Local leader
let maplocalleader = ","
" Change working directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" Buffer switch
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Toggle tagbar
nmap <leader>tb :TagbarToggle<CR>
" Toggle NERDtree
nmap <leader>nn :NERDTreeToggle<CR>
" Save and preview html
nmap <leader>wv :w <Bar> !open %<CR>
" New empty buffer
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" toggle invisible chars
nmap <leader>i :set list!<CR>
" Open Gundo
nmap <leader>gs :GundoShow<CR>
" Close Gundo
nmap <leader>gh :GundoHide<CR>
" Open Goyo
nnoremap <Leader>G :Goyo<CR>
"""}}}


""" Markdown + TeX {{{
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vimtex_compiler_progname = 'nvr'
""" }}}

""" DevIcons {{{
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif
""" }}}

""" Vim + Tmux Config {{{
set clipboard=unnamed
let g:yankring_clipboard_monitor=0
let g:tmux_navigator_save_on_switch = 2
""" }}}

" Ale settings {{{
let g:ale_sign_error = "ӿ"
let g:ale_sign_warning = '‼'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_emit_conflict_warnings = 0
let g:ale_lint_delay = 600
" }}}



" Gundo {{{
let g:gundo_prefer_python3 = 1
" }}}

" Nord {{{
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 15
" }}}

""" Goyo + Limelight {{{
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1
let g:limelight_conceal_ctermfg= 238

function! s:goyo_enter()
    if has('gui_running')
        set fullscreen
        set background=light
        set linespace=7
        set g:goyo_width = 120
    elseif exists('$TMUX')
        silent !tmux set status off
    endif
    Limelight
    let &l:statusline = '%M'
    hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
    if has('gui_running')
        set nofullscreen
        set background=dark
        set linespace=0
    elseif exists('$TMUX')
        silent !tmux set status on
    endif
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
"""}}}

""" MatchParen {{{
let g:matchparen_insert_timeout=5
"""}}}

""" Tagbar {{{
let g:tagbar_autofocus = 1
"""}}}

""" DimInactive Buffers {{{
let g:diminactive_use_syntax = 1
"""}}}



