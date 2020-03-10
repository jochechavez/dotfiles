" --------------------------------------------------------------------------- 
" ~~ INIT ~~
" ---------------------------------------------------------------------------
set nocompatible   " Disable vi-compatibility
set exrc " enable vimrc
let $PATH = '/usr/local/bin:'.$PATH

execute pathogen#infect()
syntax on
filetype on
filetype plugin on
filetype indent on

" --------------------------------------------------------------------------- 
" ~~ GENERAL ~~
" ---------------------------------------------------------------------------

set history=1000                " Enable history
set clipboard=unnamed
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set expandtab
set number 
"set backspace=2
set backspace=indent,eol,start
set ruler
set showcmd
set ignorecase
set textwidth=80
set colorcolumn=+1  
set hlsearch
set hidden                       " Enable hidden buffers
"set cursorline                  " Highlight current line
set mouse=a
set mousehide
set mousemodel=popup
set ttyfast
"let g:pymode = 0

" (Hopefully) removes the delay when hitting esc in insert mode
"set noesckeys
"set ttimeout
"set ttimeoutlen=1
set esckeys
set timeoutlen=1000 
set ttimeoutlen=0
set autochdir
set secure

set synmaxcol=200  

set scrolljump=8 " Scroll 8 lines at time at bottom/top

" --------------------------------------------------------------------------- 
" ~~ MAPPINGS ~~
" ---------------------------------------------------------------------------

let mapleader = ","

nnoremap ,<space> <CR>:nohlsearch<CR>
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bn<CR>
" Move to the previous buffer
nmap <leader>h :bp<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" javascript docs
nmap <silent> <C-l> <Plug>(jsdoc)

" Descactiva las flechitas
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Nerd Tree
nmap <C-b> :NERDTreeToggle<cr>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 2

" --------------------------------------------------------------------------- 
" ~~ PLUGINS CONF ~~
" ---------------------------------------------------------------------------

" javascript docs
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_underscore_private = 1


let g:jsx_ext_required=0                     " jsx highlighting in .js files

" UltiSnips
"let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
"let g:UltiSnipsListSnippets        = "<c-k>" " List possible snippets based on current file
" Expand snippets using ENTER
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
 
let NERDTreeIgnore = ['\.pyc$'] 

let g:syntastic_html_tidy_ignore_errors=[
            \"<ion-", "discarding unexpected </ion-", 
            \" proprietary attribute \"ng-" 
            \]

set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
set wildignore=Ui_*,*.git,*.pyc
set omnifunc=syntaxcomplete#Complete

" --------------------------------------------------------------------------- 
" ~~ AUTOCOMMANDS ~~
" ---------------------------------------------------------------------------

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType scss set omnifunc=csscomplete#CompleteCSS

autocmd FileType make setlocal noexpandtab
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 

"autoremove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e

" unused library
autocmd BufWinEnter *.js execute "ES6ImportsHighlight"
autocmd BufWinEnter *.jsx execute "ES6ImportsHighlight"
let g:es6_imports_cterm_fg_color = 'white'
let g:es6_imports_cterm_bg_color = 'darkred'
let g:es6_imports_gui_fg_color = 'white'
let g:es6_imports_gui_bg_color = 'darkred'
let g:es6_imports_excludes = ["React"]

" prettier
" autocmd FileType javascript set formatprg=prettier\ --stdin
" autocmd BufWritePre *.js :normal gggqG
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 1
let g:prettier#quickfix_auto_focus = 1
let g:prettier#autoformat = 1
nmap <Leader>py <Plug>(PrettierAsync)

" linter
" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \}

" --------------------------------------------------------------------------- 
" ~~ APPEARENCE ~~
" ---------------------------------------------------------------------------

" Disable visual bell
set noerrorbells
set novisualbell

" for my zsh terminal <3
colorscheme hybrid_material
let g:enable_bold_font = 1
"colorscheme OceanicNext
"colorscheme jellybeans
"colorscheme spacegray
"colorscheme distinguished 
"colorscheme solarized 
"colorscheme darth
"colorscheme smyck 
"colorscheme lucius 
"colorscheme onedark 
"colorscheme smyck 
"colorscheme atom-dark
"colorscheme wombat 
"colorscheme twilight 

set title
set background=dark
set encoding=utf-8
set term=screen-256color
set term=xterm
set t_Co=256
set laststatus=2   " Always show the statusline

"hi ColorColumn ctermbg=8
hi ColorColumn ctermbg=237

" for vim 8
if (has("termguicolors"))
 set termguicolors
endif

" Mouse
set guioptions-=r 
set guioptions-=L

let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" Making cursor a bar in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Ariline conf
"set guifont=Source\ Code\ Pro\ for\ Powerline:h14 "make sure to escape the spaces in the name properly
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12 "make sure to escape the spaces in the name properly
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline_symbols = {} 
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

let g:ycm_autoclose_preview_window_after_completion = 1

"set nofoldenable    " disable folding
"
" Folding 
set foldmethod=indent
set foldlevel=1
set foldclose=all

" --------------------------------------------------------------------------- 
" ~~ FUNCTIONS ~~
" ---------------------------------------------------------------------------
func! WordProcessorMode()
 setlocal textwidth=80
 setlocal smartindent
 "setlocal spell spelllang=en_us
 setlocal spell spelllang=es
 setlocal noexpandtab
endfu

com! WP call WordProcessorMode()

"quickly select text you just pasted
" press gp to select 
noremap gp `[v`] 
nnoremap p p=`] 

inoremap jj <esc>

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"replace selected text and keep clipboard
" it's a capital 'p' on the end
vmap r "_dP

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor\|build'

" let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']

" clipboard configuration
nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>

" toggle ignore case
nmap <F9> :set ignorecase! ignorecase?

" php format
let g:phpfmt_autosave = 1

""""""
" UNFOLD WHEN MOVING (up, down)
""""""
" toggle control global variable 
let g:fold_on_move_up_down = 1 " variable
nmap <leader>nf :let g:fold_on_move_up_down = 0<cr>
nmap <leader>ff :let g:fold_on_move_up_down = 1<cr>

nnoremap <silent> j :<c-u>call MoveUpDown('j', +1, 1)<cr>
nnoremap <silent> k :<c-u>call MoveUpDown('k', -1, 1)<cr>
function! MoveUpDown(cmd, dir, ndef)
    let n = v:count == 0 ? eval(a:ndef) : v:count
    let l = line('.') + a:dir * n
    if g:fold_on_move_up_down
        silent! execute l . 'foldopen!'
    endif
    execute 'norm! ' . n . a:cmd
endfunction
