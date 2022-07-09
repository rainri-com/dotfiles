#!/bin/bash

# 起動方法
# bash setup.sh

for filef in .??*; do
  [ "$f" = ".git" ] && continue
  # ファイルのシンボリックリンクを貼る
  ln -snfv "$PWD/$file" ~/
done

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