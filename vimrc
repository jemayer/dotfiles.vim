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
set textwidth=80
set colorcolumn=+1
"Always show status line
set laststatus=2
"Custom status line
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
"Highlight current line and column
set cursorline
set cursorcolumn
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
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
"Configure leader key
let mapleader = ","

" ==== Set up Vundle (https://github.com/gmarik/vundle) ====
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"List of plugins installed by Vundle
Plugin 'gmarik/Vundle.vim'
"Plugin 'rodjek/vim-puppet'
Plugin 'kien/ctrlp.vim'
Plugin 'Jimdo/vim-spec-runner'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'fatih/vim-go'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-fugitive'
Plugin 'kchmck/vim-coffee-script'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree.git'
"Color schemes
Plugin 'editorconfig/editorconfig-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

call vundle#end()
filetype plugin indent on
" ==== End of Vundle setup ====

" ==== Filetype specific settings ====
autocmd BufRead,BufNewFile *.json set ft=javascript
autocmd FileType puppet set iskeyword+=:,-
autocmd FileType ruby,yaml set ts=2|set sw=2|set sts=2|set et|set si
autocmd FileType sh,perl,awk,python set ts=4|set sw=4|set sts=4|set et|set si
autocmd FileType text,markdown set ts=4|set sw=4|set sts=4|set et|set si|set tw=80

" ====  Theme and color settings, Syntax hilighting ====
set t_Co=256
set background=dark
"colorscheme solarized
colorscheme molokai

highlight ColorColumn ctermbg=red
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
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:20'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" === Set a fancy font for vim-airline ===
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" === Tagbar ===
nmap <leader>b :TagbarToggle<CR>

"=== NERDTree ===
map <C-n> :NERDTreeToggle<CR>
