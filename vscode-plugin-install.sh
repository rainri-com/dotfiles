#!/bin/bash

# 起動方法
# bash setup.sh

BASEDIR=$(dirname $0)
cd $BASEDIR/vscode

# vscodeのプラグインをインストール
cat extensions | while read line; do
  code --install-extension $line
done

cd ~
