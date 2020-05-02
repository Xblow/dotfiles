#!/bin/sh

#Installation script
#===================

DOTFILESDIR=${HOME}/.dotfiles

#--- vim
ln -s ${DOTFILESDIR}/vim/.vimrc ${HOME}/.vimrc
ln -s ${DOTFILESDIR}/.vim/ftplugin ${HOME}/.vim/ftplugin
ln -s ${DOTFILESDIR}/.vim/Ultisnips ${HOME}/.vim/Ultisnips

#--- tmux
ln -s ${DOTFILESDIR}/tmux/.tmux.conf ${HOME}/.tmux.conf
