" --------------------------------------------------------------------------- 
" ~~ INIT ~~
" ---------------------------------------------------------------------------
set nocompatible   " Disable vi-compatibility
set exrc " enable vimrc
let $PATH = '/usr/local/bin:'.$PATH

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Plug Manager
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'

" Highlighting
Plug 'pangloss/vim-javascript'
Plug 'Yggdroot/indentLine'

" Utility
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'

" Find files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Autocomplete
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips'
Plug 'othree/html5.vim'
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'
Plug 'https://github.com/heavenshell/vim-jsdoc'

" Markdown support
Plug 'tpope/vim-markdown'

" JSX Support
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" post install (yarn install | npm install) then load plugin only for editing supported files
" Plug 'prettier/vim-prettier', {
  " \ 'do': 'yarn install',
  " \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" waka code analysis
Plug 'wakatime/vim-wakatime'

" PHP Support
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'tobyS/pdv'

" Lint
" Plug 'w0rp/ale'

" dart %% flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'thosakwe/vim-flutter'

" File explorer
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'ivalkeen/nerdtree-execute'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Multiple Cursors like sublime text
Plug 'terryma/vim-multiple-cursors'

" System clipboard
Plug 'christoomey/vim-system-copy'

" files
Plug 'tpope/vim-eunuch'

" Style & themes
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'junegunn/limelight.vim'
Plug 'mkarmona/colorsbox'
Plug 'romainl/Apprentice'
Plug 'Lokaltog/vim-distinguished'
Plug 'chriskempson/base16-vim'
Plug 'w0ng/vim-hybrid'
Plug 'AlessandroYorba/Sierra'
Plug 'daylerees/colour-schemes'
Plug 'effkay/argonaut.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'atelierbram/Base2Tone-vim'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'kristijanhusak/vim-hybrid-material'

call plug#end()

" --------------------------------------------------------------------------- 
" ~~ GENERAL ~~
" ---------------------------------------------------------------------------
syntax on
filetype plugin indent on
set history=1000                " Enable history
set clipboard=unnamed
set encoding=UTF-8
set mouse=a
set shell=/bin/zsh

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showcmd 
set wildmenu
set ls=2 " Always show status line
set wildmode=longest,list,full
set showtabline=2
set colorcolumn=80
set guifont=DroidSansMono\ Nerd\ Font\ 14

"set nofoldenable    " disable folding
" Folding 
set foldmethod=indent
set foldlevel=3
set foldclose=all

"quickly select text you just pasted
" press gp to select 
noremap gp `[v`] 
" paste and indent
" nnoremap p p=`] 

"replace selected text and keep clipboard
" it's a capital 'p' on the end
vmap r "_dP

set tw=0
set wm=0
set linebreak
set whichwrap+=>,l<,h

set lazyredraw 
set showmatch

set backspace=indent,eol,start

set nobackup
set nowritebackup
set noswapfile

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>.,trail:.,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/undo-dir/
    set undofile
catch
endtry

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
" show nerdtree if not file as input
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" --------------------------------------------------------------------------- 
" ~~ APPEARENCE ~~
" ---------------------------------------------------------------------------

" Theme and Styling
set t_Co=256
set background=dark

if (has("termguicolors"))
    set termguicolors
endif

let base16colorspace=256  " Access colors present in 256 colorspace
"colorscheme dracula 
"colorscheme nord
"colorscheme space-vim-dark
"colorscheme spacemacs-theme
colorscheme hybrid_material
" colorscheme hybrid_reverse

" Making cursor a bar in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Don't outdent hashes
inoremap # #

" Line numbers
set number

" switch buffers without saving to a currently modified file
set hidden 

" set 7 lines to the cursor = when moving vertically using j/k
set so=7
set ruler

" Enable highlighting of the current line
set cursorline

" (Hopefully) removes the delay when hitting esc in insert mode
"set noesckeys
"set ttimeout
"set ttimeoutlen=1
set esckeys
set timeoutlen=1000 
set ttimeoutlen=0


" --------------------------------------------------------------------------- 
" ~~ MAPPINGS ~~
" ---------------------------------------------------------------------------

" No wrap
"set nowrap
let mapleader = ","

" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

map <leader>l :bnext<cr>
map <leader>j :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" toggle ignore case
nmap <F9> :set ignorecase! ignorecase?

" clear selection
nnoremap ,<space> <CR>:nohlsearch<CR>

" completation
let g:lsc_auto_map = {'defaults': v:true, 'PreviousReference': '', 'NextReference': ''}
let g:lsc_server_commands = {'dart': 'dart_language_server'}

" --------------------------------------------------------------------------- 
" ~~ PLUGINS CONF ~~
" ---------------------------------------------------------------------------

"  UltiSnips
" let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
" let g:UltiSnipsListSnippets        = "<c-k>" " List possible snippets based on current file
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
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

" File explorer
" NERDTress Ctrl+b
map <C-b> :NERDTreeToggle<CR>
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 2

"Javascript Docs
nmap <silent> <C-l> <Plug>(jsdoc)
let g:javascript_plugin_jsdoc = 1

" Ctrlp ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor\|build'

" GitGutter
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>

" fuzzy search
nnoremap <silent> <leader>o :Files <CR>
nnoremap <silent> <leader>O :Files! <CR>

" emmet
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" Ariline conf
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'powerlineish'
let g:airline_theme = "hybrid"
let g:airline_symbols = {} 
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" Search for selected text. press // after select
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#444444
"highlight ColorColumn ctermbg=235 guibg=#101010

"" Hybrid material
let g:enable_bold_font = 1
" If you want comments to be in italic, also add this:
let g:enable_italic_font = 1


""""""""""""""""""""""""""""
" ~~~~~  COC CONFIG
"""""""""""""""""""""""

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""""""""""""
" ~~~~~ END COC CONFIG
"""""""""""""""""""""""


" --------------------------------------------------------------------------- 
" ~~ FUNCTIONS ~~
" ---------------------------------------------------------------------------

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
