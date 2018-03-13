set nocompatible
set encoding=utf8
filetype off

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'chrisbra/csv.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/indentpython.vim'
Plug 'roxma/nvim-completion-manager'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'lvht/tagbar-markdown'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/Align'
Plug 'garbas/vim-snipmate'
Plug 'Yggdroot/indentLine'
Plug 'davidhalter/jedi-vim'
Plug 'blueyed/vim-diminactive'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', {'do' : ':UpdateRemotePlugins'}
    Plug 'zchee/deoplete-jedi'
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    Plug 'fishbullet/deoplete-ruby'
else
    Plug 'Shougo/neocomplete.vim'
endif

Plug 'maverickg/stan.vim'
Plug 'vim-scripts/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'vim-scripts/R-syntax-highlighting'
Plug 'scrooloose/nerdcommenter'
Plug 'slim-template/vim-slim'
"Plug 'ryanoasis/vim-devicons'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'plytophogy/vim-virtualenv'
Plug 'lervag/vimtex'
""" {{{ Coloschemes

Plug 'cocopon/iceberg.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline-themes/'
Plug 'mhartington/oceanic-next'
Plug 'vim-scripts/Zenburn'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'atelierbram/Base2Tone-vim'
Plug 'chriskempson/base16-vim'
""" }}}

call plug#end()

filetype plugin indent on
filetype plugin on
syntax on
"set termguicolors
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set modifiable
set wildmenu
let maplocalleader = ","


"let g:tmuxline_powerline_separators = 1
"autocmd BufEnter * lcd %:p:h
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

set number relativenumber
set noswapfile
set tabstop=2
set shiftwidth=4
set expandtab

" R assign keymap
let R_assign = 2
" R do not indent commented
let R_indent_commented = 0
" R open Object Browser on top of Console, 10 lines height
let R_objbr_place = "console,top"
let R_objbr_w=10
let R_objbr_opendf =1
" Add pipeline operator
"autocmd FileType r inoremap <buffer> > <Esc>:normal! a %>%<CR>a
"autocmd FileType rnoweb inoremap <buffer> > <Esc>:normal! a %>%<CR>a
"autocmd FileType rmd inoremap <buffer> > <Esc>:normal! a %>%<CR>a <Paste>

set backspace=indent,eol,start
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*



" Splits
"
" Remap split pane movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Commit to trvness
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>


" Split opening
set splitbelow
set splitright





" Syntastic settings {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = ['lintr']
let g:syntastic_r_lintr_linters = "with_defaults(line_length_linter(120))"

nmap <leader>sc :SyntasticCheck<CR>
nmap <leader>st :SyntasticToggleMode<CR>
" }}}

" Theme and Airline {{{
"let g:airline_theme='zenburn'

"colorscheme seoul256
"let g:airline_theme='zenburn'
"colorscheme neodark
colorscheme nord
set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" }}}
let g:javascript_plugin_flow = 1
" Indent lines
" let g:indent_guides_enable_on_vim_startup = 1

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden


" Markdown settings {{{
let g:vim_markdown_fenced_languages = ['ruby=rb', 'python=py', 'r=r', 'javascript=js', 'julia=jl', 'bash=sh']
set conceallevel=2
let g:vim_markdown_math = 1

" }}}

" New empty buffer
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" indent
"let g:indentLine_bgcolor_term = 0
"let g:indentLine_color_term = 14
let g:indentLine_char = '│'

" auto close parentheses, brackets, and curly brackets
let g:AutoPairsFlyMode = 1

" Syntactic config {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']
"}}}


set cursorline



let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" Recognize julia files

autocmd BufRead,BufNewFile *.jl :set filetype=julia


" R icon for devicons
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = 'ℝ'
"let g:webdevicons_conceal_nerdtree_brackets = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif


nmap <leader>tb :TagbarToggle<CR>
nmap <leader>nn :NERDTreeToggle<CR>


" Extend tagbar to fetch R files. (depends on ~/.ctags)
let g:tagbar_type_r = {
            \ 'ctagstype' : 'r',
            \ 'kinds'     : [
            \ 'f:Functions',
            \ 'g:GlobalVariables',
            \ 'v:FunctionVariables',
            \ ]
            \ }



" Show invisible characters
nmap <leader>i :set list!<CR>
:set listchars=tab:▒░,trail:▓,eol:•

" set snips authorship
let g:snips_author = "Ignacio Soto Zamorano"
let g:snips_email = "ignacio[dot]soto[dot]z[at]gmail[dot]com"
let g:snips_github = "https://github.com/ignaciosotoz"

" Vim + Tmux = <3
set clipboard=unnamed
let g:yankring_clipboard_monitor=0
" Handle jedi-vim notification
" let g:jedi#force_py_version = 3


" Ale settings {{{
let g:ale_emit_conflict_warnings = 0
let g:ale_lint_delay = 600
" }}}


let g:deoplete#enable_at_startup = 1


" Gundo
let g:gundo_prefer_python3 = 1
nmap <leader>gs :GundoShow<CR>
nmap <leader>gh :GundoHide<CR>

" Nord
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 15


""" Goyo + Limelight {{{
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

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

nnoremap <Leader>G :Goyo<CR>

"""}}}


let g:diminactive_use_syntax = 1
let g:tmux_navigator_save_on_switch = 2
""" MatchParen {{{

let g:matchparen_insert_timeout=5
"""}}}


let g:airline#extensions#hunks#enabled = 0
"let g:airline_mode_map = {'__' : '-','n'  : 'N', 'i'  : 'I', 'R'  : 'R', 'c'  : 'C', 'v'  : 'V', 'V'  : 'V', ' ' : 'V', 's'  : 'S', 'S'  : 'S', ' ' : 'S' }
let g:tagbar_autofocus = 1
let g:limelight_conceal_ctermfg= 238
""" Unused {{{
"" tmux shell theme sync
"if filereadable(expand("~/.vimrc_background"))
"let base16colorspace=256
"source ~/.vimrc_background
"endif




"set statusline=

"set statusline+=\[%{mode()}\]                 " current mode
"set statusline+=%F                            " current file path
"set statusline+=\                             " blank space
"set statusline+=%y                            " filetype
"set statusline+=\                             " blank space
"set statusline+=%m                            " modified flag [+]
"set statusline+=\                             " blank space

"set statusline+=%=                            " right-align from now on

""set statusline+=%{PasteForStatusline()}       " paste flag
"set statusline+=\                             " blank space
"set statusline+=%v                            " column number
"set statusline+=\:                            " colon separator
"set statusline+=%l                            " row number
"set statusline+=\/                            " slash separator
"set statusline+=%L                            " number of rows
"set statusline+=\                             " blank space
"set statusline+=%P                    " buffer number

"set statusline+=%#warningmsg#                 " Syntastic error flag
"set statusline+=%{SyntasticStatuslineFlag()}  " Syntastic error flag
"set statusline+=%*                            " Syntastic error flag

