#!/bin/bash
# Package all config file of VIM.
set -u

ROOT_DIR="$HOME"
VIM_CFG="vim_cfg"
BACKUP_DIR="$ROOT_DIR/$VIM_CFG"
VUNDLE_DIR="$BACKUP_DIR/.vim/bundle"
UNDO_DIR="$BACKUP_DIR/.vim/undo"
VUNDLE_PLUGIN="Vundle.vim"
TGZ_FILE="vim_cfg_$(date +%Y%m%d).tgz"

#Jump to home
cd "$ROOT_DIR" || { echo "CD $ROOT_DIR error"; exit 1; }

#Create backup directory and enter it
echo "Create $VIM_CFG directory ..."
mkdir -p "$BACKUP_DIR" || { echo "Create $BACKUP_DIR error"; exit 1; }
pushd . > /dev/null
cd "$BACKUP_DIR" || { echo "CD $BACKUP_DIR error"; exit 1; }

#Copy config files
echo "Copy VIM config files ..."
cp -a ~/.vim . || { echo "Copy .vim error"; exit 1; }
cp -a ~/.vimrc . || { echo "Copy .vimrc error"; exit 1; }

#Clean usless files
echo "Clean temporary files ..."
rm -f "$BACKUP_DIR/.vim/.netrwhist"

echo "Clean undo files ..."
if [ -d "$UNDO_DIR" ] ;then
    rm -f "$UNDO_DIR"/*
fi

#Clean all vim plugins except vundle
echo "Clean vim plugins ..."
pushd . > /dev/null
cd "$VUNDLE_DIR" || { echo "CD $VUNDLE_DIR error"; exit 1; }

for plugin in * ;do
    if [ x"$plugin" != x"$VUNDLE_PLUGIN" ];then
        #echo "Clean $plugin"
        rm -rf "$plugin"
    fi
done
popd > /dev/null

#Return to home directory
popd > /dev/null

#Pack config files
echo "Create package ..."
tar zcf "$TGZ_FILE" "$VIM_CFG" || { echo "ERROR"; exit 1; }
rm -rf "$BACKUP_DIR"

echo
echo "done."
echo "The vim config has been packed into $ROOT_DIR/$TGZ_FILE"
echo
exit 0
