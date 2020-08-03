set encoding=utf8
filetype off

if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
set rtp+=/usr/local/opt/fzf

""" General Plugins {{{
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'chrisbra/csv.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'blueyed/vim-diminactive'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'sheerun/vim-polyglot'
Plug 'lifepillar/pgsql.vim'
Plug 'majutsushi/tagbar'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ap/vim-buftabline'
"""}}}

""" Language Specific Plugins {{{

" R
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'vim-scripts/R-syntax-highlighting'
Plug 'maverickg/stan.vim'

" Python
Plug 'ncm2/ncm2-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'Shougo/deoplete.nvim', { 'do' : 'UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neocomplete.vim'

" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

Plug 'slim-template/vim-slim'
if has('nvim')
    Plug 'fishbullet/deoplete-ruby'
else
    Plug 'Shougo/neocomplete.vim'
endif


" Node/JS
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }

" Markdown / LaTeX
Plug 'gabrielelana/vim-markdown'
Plug 'lvht/tagbar-markdown'
Plug 'lervag/vimtex'

" Julia
Plug 'JuliaEditorSupport/julia-vim'
let g:tagbar_type_julia = {
    \ 'ctagstype' : 'julia',
    \ 'kinds'     : [
        \ 't:struct', 'f:function', 'm:macro', 'c:const']
    \ }


Plug 'chriskempson/base16-vim'
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
set nuw=6
set expandtab
" indent
"let g:indentLine_char ="┆"
" highlight current line
set cursorline
" standarize backspace deletion
set backspace=indent,eol,start
" display warnings
"set statusline+=%#warningmsg#
set hidden
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
autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>
autocmd Filetype ipynb nmap <silent><Leader>n :VimpyterStartNteract<CR>

set completefunc=emoji#complete
""" R {{{

" R assign keymap
let R_assign = 2
" R do not indent commented
let R_indent_commented = 0
" R open Object Browser on top of Console, 10 lines height
let R_objbr_place = "BOTTOM"
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
" R output is highlighted with current colorscheme
let g:rout_follow_colorscheme = 1

" R commands in R output are highlighted
let g:Rout_more_colors = 0
""" }}}


set noshowmode
set nospell
syntax enable
set mouse=a
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:currentmode={ 'n' : 'ﳁ ','no' : 'N·Operator Pending ', 'v' : '濾','V' : '閭','^V' : '閭','' : 's ','S': 's-line','^S' : 's-block ','i' : ' ','R' : 'Replace ','Rv' : 'V·Replace ','c' : ' ','cv' : 'Vim Ex ','ce' : 'Ex ','r' : ' ','rm' : 'More ','r?' : 'Confirm ','!' : ' ','t' : ' '}

function! ModeCurrent() abort
    let l:modecurrent = mode()
        let l:modelist = tolower(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" StatusbaAar
set laststatus=2
set statusline=
set statusline+=\%#TermCursor#
set statusline+=\ %{ModeCurrent()}
set statusline+=\ %#FoldColumn#
set statusline+=\ %{WebDevIconsGetFileTypeSymbol()}
set statusline+=\ %f
set statusline+=\ %#StatusLineNC#
set statusline+=\ %{LinterStatus()} 
set statusline+=\ %M
set statusline+=\ %#VertSplit#
set statusline+=%=
set statusline+=\ %#TermCursor#
set statusline+=\ %l:%L
set statusline+=\ ⵂ
set statusline+=\ %P
set statusline+=\ 

"let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
silent! let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = 'ﳒ'
silent! let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['csv'] = ''
silent! let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = 'ﬥ'
silent! let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['zip'] = ''
silent! let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rar'] = ''
silent! let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tar'] = ''
silent! let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['erb'] = ''
silent! let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
silent! let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ipynb'] = ''

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:WebDevIconsNerdTreeAfterGlyphPadding = ''


" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Markdown settings {{{
    let g:vim_markdown_fenced_languages = ['ruby=rb', 'python=py', 'r=r', 'javascript=js', 'julia=jl', 'bash=sh']
    set conceallevel=2
    let g:vim_markdown_math = 1
" }}}


""" Mappings {{{
    " Local leader
    let mapleader=" "
    let maplocalleader = ","
    " fzf mappings
    nmap <leader>bl :BLines<CR>
    nmap <leader>ll :Lines<CR>
    nmap <leader>sn :Snippets<CR>
    nmap <leader>ag :Ag<CR>
    nmap <leader>bf :Buffer<CR>
    nmap <leader>ta :Tags<CR>
    nmap <leader>fl :Files<CR>
    nmap <leader>cgc :BCommits<CR>
    nmap <leader>gc :Commits<CR>
    " Change working directory
    nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
    " Buffer switch
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
    " New empty buffer
    nmap <leader>T :enew<cr>
    " Move to the next buffer
    nmap <leader>l :bnext<CR>
    " Move to the previous buffer
    nmap <leader>h :bprevious<CR>
    " Close the current buffer and move to the previous one
    nmap <leader>bq :bp <BAR> bd #<CR>
    " Quick save
    nnoremap <Leader>W :w<CR>
    " Quick close buffer
    nnoremap <Leader>C :close<CR>
    " Quick delete buffer
    nmap <Leader>bd :bd <BAR> :close <CR>
    " Quick save and close
    nnoremap <Leader>WQ :wq<CR>
    " Quick delete buffer
    nnoremap <Leader>bd :bd!<CR>
    " quick source
    nnoremap <Leader>src :so ~/.vimrc<CR>
    " Toggle tagbar
    nmap <leader>tb :TagbarToggle<CR>
    " Toggle NERDtree
    nmap <leader>nn :NERDTreeToggle<CR>
    " Save and preview html
    nmap <leader>wv :w <Bar> !open %<CR>
    " toggle invisible chars
    nmap <leader>i :set list!<CR>
    " Open Gundo
    nmap <leader>gs :GundoShow<CR>
    " Close Gundo
    nmap <leader>gh :GundoHide<CR>
    " Open Goyo
    nnoremap <Leader>G :Goyo<CR>
    " yankstack
    nmap <Leader>Y :Yanks<CR>
    " Next error
    nnoremap <leader>at :ALEToggle<CR>
    nmap <leader>ne :ALENext<CR>
    " Enable spanish spell checker
    nnoremap <Leader>scs :set spelllang=es<CR>:setlocal spell<CR>
    " Enable english spell checker
    nnoremap <Leader>sce :set spelllang=en<CR>:setlocal spell<CR>
"""}}}

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'ok' : printf(' %d  %d', all_non_errors, all_errors )
endfunction

""" Markdown + TeX {{{
    let g:vim_markdown_conceal = 0
    let g:tex_conceal = ""
    let g:vim_markdown_math = 1
    let g:vimtex_compiler_progname = 'nvr'
""" }}}

""" Vim + Tmux Config {{{
    set clipboard=unnamed
    let g:yankring_clipboard_monitor=0
    let g:tmux_navigator_save_on_switch = 2
    let g:tmux_navigator_no_mappings = 1

    nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
""" }}}

" Ale settings {{{
    let g:ale_sign_error = ""
    let g:ale_sign_warning = ''
    let g:ale_emit_conflict_warnings = 0
    let g:ale_lint_delay = 600
    let g:ale_set_highlights = 0
    let b:ale_warn_about_trailing_whitespace = 0
    highlight! clear ALEErrorSign
    highlight! clear ALEWarningSign
    "hi link ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500 guibg=#F5F5F5
    "hi link ALEWarningSign ctermfg=11 ctermbg=15 guifg=#ED6237 guibg=#F5F5F5
" }}}



" Gundo {{{
let g:gundo_prefer_python3 = 1
" }}}

""" Goyo + Limelight {{{
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1
let g:limelight_conceal_ctermfg= 238

function! s:goyo_enter()
    if has('gui_running')
        set fullscreen
        set linespace=7
        set g:goyo_width = 160
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
        colorscheme gotham
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



augroup configgroup
    autocmd!
    "autocmd VimEnter so ~/.vimrc
    "autocmd BufWritePre *.py, *.js, *.md, *.txt, *.R, *.jl, *.sh
                "\:call <SID>StripTrailingWhitespaces()_
    " ruby
    autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.rb setlocal tabstop=2
    autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.rb setlocal shiftwidth=2
    autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.rb setlocal softtabstop=2
    " bash
    autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.sh setlocal tabstop=2
    autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.sh setlocal shiftwidth=2
    autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.sh setlocal softtabstop=2
    " python
    autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.py setlocal tabstop=4
    autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.py setlocal shiftwidth=4
    autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.py setlocal softtabstop=4
    " R
    autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.R setlocal tabstop=4
    autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.R setlocal shiftwidth=4
    autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.R setlocal softtabstop=4
    autocmd BufEnter,BufNewFile,BufRead, BufNewFile *.rmd set filetype=rmarkdown
    " Markdown
    autocmd BufEnter,BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END


"function s:updateCursorLine()
    "if %background == "dark"
        "highlight CursorLineNr guifg=green guibg=NONE gui=NONE
    "else
        "highlight CursorLineNr guifg=red guibg=NONE gui=NONE
    "endif
"endf

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

"autocmd ColorScheme * call s:updateCursorLine()
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c

set tags=tags;
