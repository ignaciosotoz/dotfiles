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
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
Plug 'roxma/nvim-completion-manager'
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
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
Plug 'luochen1990/rainbow'
Plug 'vim-syntastic/syntastic'
Plug 'mgee/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
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
"Plug 'lvht/tagbar-markdown'
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
Plug 'mhartington/oceanic-next'
Plug 'vim-scripts/Zenburn'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-two-firewatch'
Plug 'rakr/vim-one'
Plug 'vim-scripts/Wombat'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
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
set number
set noswapfile
set tabstop=2
set shiftwidth=4
set expandtab
" indent
let g:indentLine_char ="┊"
" auto close parentheses, brackets, and curly brackets
let g:AutoPairsFlyMode = 1
" highlight current line
set cursorline
" standarize backspace deletion
set backspace=indent,eol,start
" display warnings
"set statusline+=%#warningmsg#
"set hidden
" Split opening
set splitbelow
set splitright
" Show invisible characters
set listchars=tab:▶-,trail:•,extends:»,precedes:«,eol:¬
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
let R_objbr_place = "console"
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
if !has('gui_running')
    set t_Co=256
endif
set noshowmode
colorscheme Tomorrow-Night-Eighties
set laststatus=2
set showtabline=2
let g:lightline = {}
let g:lightline = {
            \   'colorscheme': 'wombat',
            \   'active': {
            \     'left': [ [ 'mode' ], [ 'gitbranch', 'readonly', 'modified' ], [ 'pwd' ] ],
            \     'right': [ [ 'lineinfo','fileinfo'], ['linter_ok', 'linter_checking', 'linter_errors', 'linter_warnings', 'trailing' ] ],
            \   },
            \   'inactive': {
            \     'left': [ [ 'pwd' ] ],
            \     'right': [ [ 'lineinfo' ], [ 'fileinfo' ] ],
            \   },
            \   'tabline': {
            \     'left': [ [ 'buffers' ] ],
            \     'right': [ [ 'close' ] ],
            \   },
            \   'mode_map': {
            \     'n' : 'N',
            \     'i' : 'I',
            \     'R' : 'R',
            \     'v' : 'V',
            \     'V' : 'V-LINE',
            \     "\<C-v>": 'V-BLOCK',
            \     'c' : 'C',
            \     's' : 'S',
            \     'S' : 'S-LINE',
            \     "\<C-s>": 'S-BLOCK',
            \     't': '󰀣 ',
            \   },
            \   'component': {
            \     'lineinfo': '%l:%-v',
            \   },
            \   'component_expand': {
            \     'buffers': 'lightline#bufferline#buffers',
            \     'trailing': 'lightline#trailing_whitespace#component',
            \     'linter_ok': 'lightline#ale#ok',
            \     'linter_checking': 'lightline#ale#checking',
            \     'linter_warnings': 'lightline#ale#warnings',
            \     'linter_errors': 'lightline#ale#errors',
            \   },
            \   'component_function': {
            \     'gitbranch': 'fugitive#head',
            \     'pwd': 'LightlineWorkingDirectory',
            \     'fileinfo': 'LightlineFileinfo',
            \     'filetype': 'MyFiletype',
            \     'fileformat': 'MyFileformat'
            \   },
            \   'component_type': {
            \     'buffers': 'tabsel',
            \     'trailing': 'error',
            \     'linter_ok': 'left',
            \     'linter_checking': 'left',
            \     'linter_warnings': 'warning',
            \     'linter_errors': 'error',
            \   },
            \ }


function! LightlineWorkingDirectory()
    return &ft =~ 'help\|qf' ? '' : fnamemodify(getcwd(), ":~:.")
endfunction


function! LightlineFileinfo()
    if winwidth(0) < 90
        return ''
    endif

    let encoding = &fenc !=# "" ? &fenc : &enc
    let format = &ff
    let type = &ft !=# "" ? &ft : "no ft"
    return type . ' | ' . format . ' | ' . encoding
endfunction
"""" Lightline ALE
let g:lightline#ale#indicator_warnings = ' '
let g:lightline#ale#indicator_errors = ' '
let g:lightline#ale#indicator_checking = ' '

"""" lightline-bufferline
let g:lightline#bufferline#filename_modifier = ':~:.' " Show filename relative to current directory
let g:lightline#bufferline#unicode_symbols = 1        " Use fancy unicode symbols for various indicators
let g:lightline#bufferline#modified = '※'             " Default pencil is too ugly
let g:lightline#bufferline#unnamed = 'ℕ      '      " Default name when no buffer is opened
let g:lightline#bufferline#shorten_path = 1           " Compress ~/my/folder/name to ~/m/f/n


function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
" }}}



" Markdown settings {{{
let g:vim_markdown_fenced_languages = ['ruby=rb', 'python=py', 'r=r', 'javascript=js', 'julia=jl', 'bash=sh']
set conceallevel=2
let g:vim_markdown_math = 1
" }}}


""" Mappings {{{

nmap <leader>bl :BLines<CR>
nmap <leader>ll :Lines<CR>
nmap <leader>sn :Snippets<CR>
nmap <leader>ag :Ag<CR>
nmap <leader>bf :Buffer<CR>
nmap <leader>tg :BTags<CR>
nmap <leader>ta :Tags<CR>
nmap <leader>fl :Files<CR>
nmap <leader>cgc :BCommits<CR>
nmap <leader>gc :Commits<CR>

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
"nmap <leader>tb :TagbarToggle<CR>
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
" Quick save
nnoremap <Leader>W :w<CR>
" Quick close buffer
nnoremap <Leader>C :close<CR>
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

""" Fzf Colors {{{
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
""" }}}

"vim:foldmethod=marker:foldlevel=0
