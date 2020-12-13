" vimplug plugin configurations

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'feix760/vim-javascript-gf'
Plug 'farmergreg/vim-lastplace'
Plug 'dart-lang/dart-vim-plugin'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vimlab/split-term.vim'
Plug 'vim-airline/vim-airline'

call plug#end()

" Airline
let g:airline_extensions = []

" git gutter faster refresh
set updatetime=100

" ack.vim
let g:ackprg = 'ag --ignore PlayOnLinux\* --ignore sshfs --ignore Android\* --ignore android\* --ignore run --ignore tags -if'
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" show the line exceeding 80 columns
set colorcolumn=80,100

" Set the pwd to the current file
autocmd BufEnter * silent! lcd %:p:h

set autoindent
set smartindent
set cursorline
set cursorcolumn
set wrap
autocmd BufNewFile,BufRead *.tt  setlocal syntax=html
autocmd BufNewFile,BufRead *.sql setlocal syntax=sql
autocmd BufNewFile,BufRead *.js  setlocal suffixesadd=.js

set ts=4 sts=4 sw=4 expandtab
set number
set spell spelllang=en_us
set termguicolors

" gruvbox
syntax enable
set background=dark
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox

" Nerd tree
map <C-n> :NERDTreeToggle<CR>

" FZF
nnoremap <silent> <Leader>c :cd %:h<CR>
nnoremap <silent> <Leader>f :FZF ~/git<CR>
nnoremap <silent> <Leader>F :FZF<CR>
nnoremap <silent> <Leader><Leader> :Files <C-R>=expand('%:h')<CR><CR>

" Open a new tab
set splitright
set splitbelow
nnoremap <silent> <Leader>t :15Term<CR>

" Open a new small terminal window
nnoremap <silent> <Leader>T <C-W>s10<C-W>+<C-W>j:term<CR>:startinsert<CR>

" Save the current file
nnoremap <silent> <Leader>w :w<CR>

" Say the selected text
vnoremap <silent> <Leader>s ::w !say&<CR><CR>

" Change the window leader key to w
nnoremap <silent> w <C-W>

" Tags
set tags=/home/git/tags

" Security
set nomodeline

" set shellcmdflag=-ic

" nvim
if has('nvim')
    tnoremap <C-w>h <C-\><C-n><C-w>h

    tnoremap <C-w>j <C-\><C-n><C-w>j

    tnoremap <C-w>k <C-\><C-n><C-w>k

    tnoremap <C-w>l <C-\><C-n><C-w>l

    augroup TerminalStuff
       au!
      autocmd TermOpen * setlocal nonumber norelativenumber
    augroup END
endif

