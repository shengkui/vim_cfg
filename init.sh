#!/bin/bash

VIM_DIR="${HOME}/.vim"

mkdir -p "${VIM_DIR}"/{bundle,tags,undo} || { echo "make .vim dir error"; exit 1; }
cp -avf UltiSnips "${VIM_DIR}" || { echo "copy UltiSnips error"; exit 1; }
cp -vf _vimrc "${HOME}"/.vimrc || { echo "copy .vimrc error"; exit 1; }

#Install vim-plug
curl -fLo "${VIM_DIR}"/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    || { echo "intsll vim-plug error"; exit 1; }
