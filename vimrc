" Defaults
set tw=2 sts=2 et tw=0

" set up Vundle (https://github.com/gmarik/vundle)
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" list of plugins installed by Vundle
Bundle 'gmarik/vundle'
Bundle 'rodjek/vim-puppet'
Bundle 'kien/ctrlp.vim'
" end of Vundle setup

let mapleader = ","
filetype plugin indent on

autocmd BufRead,BufNewFile *.json set ft=javascript
autocmd FileType puppet setlocal iskeyword+=:,-
autocmd FileType python set sts=4 sw=4

" Filetype specific settings
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd FileType ruby setlocal sw=2 sts=2 et tw=0
autocmd FileType python setlocal sw=4 sts=4 et tw=0

" Theme and color settings, Syntax hilighting
set background=dark
colorscheme solarized

syntax on
set ruler

highlight ExtraWhitespace ctermbg=darkred
match ExtraWhitespace /\s\+$/

" Searching & Moving
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
nnoremap <leader>n :call RenameFile()<cr>

" git diff for current file (unstaged and staged)
nnoremap <leader>d :!git diff %<cr>
nnoremap <leader>D :!git diff<cr>

nnoremap <leader>f :CtrlP<cr>
