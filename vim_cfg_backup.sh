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

#----------------------------------------------
echo "Create $VIM_CFG directory ..."
mkdir -p "$BACKUP_DIR" || { echo "Create $BACKUP_DIR error"; exit 1; }

pushd . > /dev/null
cd "$BACKUP_DIR" || { echo "CD $BACKUP_DIR error"; exit 1; }

#----------------------------------------------
echo "Copy VIM config files ..."
cp -a ~/.vim . || { echo "Copy .vim error"; exit 1; }
cp -a ~/.vimrc . || { echo "Copy .vimrc error"; exit 1; }

#----------------------------------------------
echo "Clean temporary files ..."
rm -f "$BACKUP_DIR/.vim/.netrwhist"

#----------------------------------------------
echo "Clean undo files ..."
#pushd . > /dev/null
#cd "$UNDO_DIR" || { echo "CD $UNDO_DIR error"; exit 1; }
#rm -f *
#popd > /dev/null
if [ -d "$UNDO_DIR" ] ;then
    rm -f "$UNDO_DIR"/*
fi

#----------------------------------------------
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

#----------------------------------------------
popd > /dev/null

echo "Create package ..."
tar zcf "$TGZ_FILE" "$VIM_CFG" || { echo "ERROR"; exit 1; }
rm -rf "$BACKUP_DIR"

echo
echo "done."
echo "The vim config has been packed into $ROOT_DIR/$TGZ_FILE"
echo
exit 0
