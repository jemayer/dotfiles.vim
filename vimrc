" ==== Some sane defaults ====
"Make vim behave in a more useful way (this is the default, anyway)
set nocompatible
"Set enconding to UTF-8
set encoding=utf-8
"Set tab width (ts)
set tabstop=2
"Set shift width (sw)
set shiftwidth=2
"Backspace deletes this many spaces instead of just one (sts)
set softtabstop=2
"Expand tabs to spaces (et)
set expandtab
"Smart-indent behaviour after newline (si)
set smartindent
"Remember more commands and searches
set history=1000
"Height of commandline
set cmdheight=2
"Show line and column number
set ruler
"Highlight screen column
set colorcolumn=81
"Always show status line
set laststatus=2
"Custom status line
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
"Highlight current line
set cursorline
"Show line numbers
set number
"Minimal number of columns to use for line numbers
set numberwidth=4
"Display incomplete commands
set showcmd
"Enable syntax highlighting
syntax on
"Better display of strings
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
"Yank and paste with the system clipboard
set clipboard=unnamed
"Highlight whitespaces at the end of the line
highlight ExtraWhitespace ctermbg=darkred
match ExtraWhitespace /\s\+$/
"Configure leader key
let mapleader = ","

" ==== Set up Vundle (https://github.com/gmarik/vundle) ====
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"List of plugins installed by Vundle
Bundle 'gmarik/vundle'
Bundle 'rodjek/vim-puppet'
Bundle 'kien/ctrlp.vim'
"End of Vundle setup

filetype plugin indent on

" ==== Filetype specific settings ====
autocmd BufRead,BufNewFile *.json set ft=javascript
autocmd FileType puppet set iskeyword+=:,-
autocmd FileType sh,perl,awk,python set ts=4|set sw=4|set sts=4
autocmd FileType text,markdown set ts=4|set sw=4|set et|set si|set tw=80

" ====  Theme and color settings, Syntax hilighting ====
set t_Co=256
set background=dark
colorscheme solarized

" ==== Searching & Moving ====
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" ==== Rename current file ====
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

" ==== git diff for current file (unstaged and staged) ====
nnoremap <leader>d :!git diff %<cr>
nnoremap <leader>D :!git diff<cr>

" ==== Needs Ctrl-P (installed by vundler) ====
nnoremap <leader>f :CtrlP<cr>

" ==== Source spec-runner ====
source ~/.vim/scripts/spec-runner.vim
