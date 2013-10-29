dotfiles.vim
============

My VIM configuration, online. Bundles are managed by [vundle](https://github.com/gmarik/vundle).

## Installation

* Clone to ~/.vim: `git clone https://github.com/jemayer/dotfiles.vim.git ~/.vim`
* Initialize submodule: `cd ~/.vim && git submodule init && git submodule update`
* Create symlink for gitconfig: `cd ~ && ln -s ~/.vim/vimrc ~/.vimrc`
* Initialize [vundle](https://github.com/gmarik/vundle): `vim +BundleInstall +qall`
