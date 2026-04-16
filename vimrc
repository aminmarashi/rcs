" vimplug plugin configurations

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
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
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'xafron-bv/tts', { 'rtp': 'tts-vim' }

call plug#end()

" Avoid hanging with large TS files on mac
set re=2

" --- vim-airline ---
" Status line at the bottom of the window
let g:airline_extensions = []

" --- vim-gitgutter ---
" Shows +/- signs in the gutter for git changes, refreshes every 100ms
"   ]c / [c       jump to next/prev hunk
"   <Leader>hp    preview hunk
"   <Leader>hs    stage hunk
"   <Leader>hu    undo hunk
set updatetime=100

" --- ripgrep + fzf.vim (text search in files, like VSCode Cmd+Shift+F) ---
"   <Leader>a     interactive project search using ripgrep
"   :RG <pat>     live-updating search across files
set grepprg=rg\ --vimgrep\ --smart-case
nnoremap <Leader>a :RG<Space>

" --- General vim settings ---
" show the line exceeding 80 columns
" set colorcolumn=80,100
set colorcolumn=

set autoindent
set smartindent
" set cursorline
set nocursorline
" set cursorcolumn
set nocursorcolumn
set wrap

augroup VimrcFileBehavior
  au!
  " Only change the local cwd for real files; skip plugin/help/terminal buffers.
  autocmd BufEnter * if expand('%:p') !=# '' && isdirectory(expand('%:p:h')) | execute 'lcd ' . fnameescape(expand('%:p:h')) | endif
  autocmd BufNewFile,BufRead *.tt  setlocal syntax=html
  autocmd BufNewFile,BufRead *.sql setlocal syntax=sql
  autocmd BufNewFile,BufRead *.js  setlocal suffixesadd=.js
augroup END

set ts=4 sts=4 sw=4 expandtab
set number
set spell spelllang=en_us

syntax enable

" --- gruvbox (color scheme) ---
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

" --- NERDTree (file tree, like VSCode sidebar explorer) ---
"   Ctrl+n        toggle NERDTree
"   Inside NERDTree:
"     o            open file
"     s            open in vertical split
"     i            open in horizontal split
"     t            open in new tab
"     m            file menu (create/rename/delete)
map <C-n> :NERDTreeToggle<CR>

" --- fzf.vim (fuzzy file finder, like VSCode Cmd+P) ---
" Use ripgrep to list files, which respects .gitignore
let $FZF_DEFAULT_COMMAND = 'rg --files'
"   <Leader>f         find files in ~/devel
"   <Leader>F         find files from current working dir
"   <Leader><Leader>  find files relative to current file's directory
"   <Leader>c         cd to current file's directory
"   Also available (no mapping, use as commands):
"     :Buffers         open buffers (like VSCode tab switcher)
"     :Lines           search lines in open buffers
"     :BLines          search lines in current buffer
"     :History         recently opened files
"     :Rg <pattern>    ripgrep search with live preview
nnoremap <silent> <Leader>c :cd %:h<CR>
nnoremap <silent> <Leader>f :FZF ~/devel<CR>
nnoremap <silent> <Leader>F :FZF<CR>
nnoremap <silent> <Leader><Leader> :Files <C-R>=expand('%:h')<CR><CR>

" --- split-term.vim (terminal splits, like VSCode Ctrl+`) ---
"   <Leader>t     open 15-line terminal split
"   <Leader>T     open a smaller terminal split
set splitright
set splitbelow
" Prevent splits from being resized when opening or closing other splits
set noequalalways
nnoremap <silent> <Leader>t :15Term<CR>
nnoremap <silent> <Leader>T <C-W>s10<C-W>+<C-W>j:term<CR>:startinsert<CR>

" --- General mappings ---
"   <Leader>w     save the current file
nnoremap <silent> <Leader>w :w<CR>

" --- Window management (like VSCode Cmd+\ to split, Cmd+1/2/3) ---
" 'w' is remapped to Ctrl-W, so window commands become:
"   wh / wj / wk / wl    move to left/down/up/right window
"   ws                    horizontal split
"   wv                    vertical split
"   wq                    close window
"   w=                    equalize window sizes
"   w+ / w-               increase/decrease height
"   w> / w<               increase/decrease width
nnoremap <silent> w <C-W>

" --- Tags ---
set tags=~/devel/tags

" --- Security ---
set nomodeline

" set shellcmdflag=-ic

" --- vim-fugitive (git integration, like VSCode source control panel) ---
"   :Git (or :G)      git status (stage with s, unstage with u, commit with cc)
"   :Git diff          inline diff
"   :Git blame         blame annotations
"   :Git log           log
"   :Gdiffsplit        side-by-side diff of current file

" --- vim-surround (no VSCode equivalent) ---
"   cs"'          change surrounding " to '
"   ds"           delete surrounding "
"   ysiw]         surround word with []
"   S<tag>        surround selection with tag (visual mode)

" --- Terminal scrolling ---
" In terminal mode, to scroll up:
"   Ctrl-\ Ctrl-n     exit terminal mode (enters normal mode)
"   Then scroll:  Ctrl-u (half page up), Ctrl-b (full page up), k, etc.
"   i or a             go back to terminal insert mode

" --- nvim terminal window navigation ---
" Ctrl-w h/j/k/l in terminal mode escapes and switches windows
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
