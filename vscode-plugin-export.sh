#!/bin/bash

# 起動方法
# bash setup.sh

BASEDIR=$(dirname $0)
cd $BASEDIR/vscode

# vscodeのプラグインをエクスポート
code --list-extensions > extensions

cd ~
