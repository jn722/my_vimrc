"
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Initialize plugin system

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI=1
let NERDTreeWinSize=25
let NERDTreeAutoDeleteBuffer=1
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'ronakg/quickr-cscope.vim'
let g:quickr_cscope_program = "gtags-cscope"
let g:quickr_cscope_db_file = "GTAGS"
Plug 'stefandtw/quickfix-reflector.vim'
"quickfix
set cscopequickfix=s-,c-,d-,i-,t-,e-,f-,g-
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

Plug 'mbriggs/mark.vim'
Plug 'mhinz/vim-grepper'

Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'uarun/vim-protobuf'
"for v-lang
Plug 'ollykel/v-vim'

Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0 
autocmd FileType html,css EmmetInstall
call plug#end()
"
" Then reload .vimrc and :PlugInstall to install plugins.

" Put your non-Plug stuff after this line
"
syntax enable
set pyxversion=3
let g:python3_host_prog = '/usr/local/bin/python3.8'
set nu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set fileencodings=utf-8,gb2312
set hlsearch
set incsearch
set showcmd
set scrolloff=3
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set nowrap
set guioptions-=T
set termguicolors
behave xterm
colorscheme evening
"set mouse=a

set autowrite

let maplocalleader=','
nnoremap <localleader>q :cclose<CR>
nnoremap <localleader>w :copen<CR>
nnoremap <localleader>t :CocCommand terminal.Toggle<cr>
nnoremap <localleader>bb :Buffers<CR>
nnoremap <localleader>ff :Files<CR>
nnoremap <localleader>ft :NERDTreeToggle<CR>
nnoremap <localleader>ev :vsplit $MYVIMRC<CR>
nnoremap <localleader>sv :source $MYVIMRC<CR>
nnoremap <localleader>ss :Grepper -cword<CR>
nnoremap <localleader>bd :bdel! %<CR>
nnoremap <localleader>gs :Gstatus<CR>
nnoremap <localleader>gc :Gcommit<CR>
nnoremap <localleader>gp :Gpush<CR>
nnoremap <localleader>gg :Gpull<CR>


inoremap <A-t> :split term://bash<CR>
nnoremap <A-t> :split term://bash<CR>
"tnoremap <Esc> <C-\><C-n>

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"nnoremap <silent> <space>t  :CocCommand terminal.Toggle<cr>

