#!/bin/bash

# 起動方法
# bash setup.sh

for file in .??*; do
  [ "$file" = ".git" ] && continue
  # ファイルのシンボリックリンクを貼る
  ln -snfv "$PWD/$file" ~/
done

if [ ! -d "$HOME/.config" ]; then
  mkdir "$HOME/.config"
fi

for dir in config/*; do
  # ディレクトリを作成
  if [ ! -d "$HOME/.$dir" ]; then
    mkdir "$HOME/.$dir"
  fi

  for file in $dir/*; do
    # ディレクトリのシンボリックを貼る
    if [ -d $file ]; then
      ln -snfv "$PWD/$file" "$HOME/.$file"
    fi
    # ファイルのシンボリックを貼る
    if [ -f $file ]; then
      ln -snfv "$PWD/$file" "$HOME/.$file"
    fi
    echo $file
  done
done

# vscodeのシンボリックリンクを貼る
