#!/bin/bash

# 事前準備
# https://reactnative.dev/docs/environment-setup
# AndroidStudioをインストールし、環境変数を設定する
#  ANDROID_HOMEは不要
#  PATH = %LOCALAPPDATA%\Android\Sdk\platform-tools

# 起動方法
# bash setup.sh

# linkを実行
sh link.sh

# passwordを要求
read -sp "password:" password

# aptのアップデート
echo "${password}" | sudo -S apt-get update
yes | sudo apt-get upgrade

# tmuxのインストール
yes | sudo apt install tmux

# vimのインストール
yes | sudo apt install vim

# fishのインストール
yes | sudo apt install fish
echo "${password}" | chsh -s $(which fish)

# asdfのインストール
yes | sudo apt install curl git
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
source $HOME/.asdf/asdf.sh
mkdir -p ~/.config/fish/completions && ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

# nodejsのインストール
yes | sudo apt install dirmngr gpg curl gawk
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

# yarnのインストール
asdf plugin add yarn
asdf install yarn latest
asdf global yarn latest

# rustのインストール
yes | sudo apt install libwebkit2gtk-4.0-dev build-essential curl wget libssl-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev
asdf plugin add rust
asdf install rust latest
asdf global rust latest

# openjdkのインストール
yes | sudo apt install openjdk-11-jdk
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

# gradleのインストール
yes | sudo apt install gradle

# LinuxのCommandLineToolsのインストール
# 最新版は https://developer.android.com/studio#command-tools から確認できる。
cd ~
yes | sudo apt install unzip
wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip
unzip commandlinetools-linux-* -d Android
rm -rf commandlinetools-linux-*
cd Android
mv cmdline-tools latest
mkdir cmdline-tools
mv latest cmdline-tools
cd cmdline-tools/latest/bin
yes | ./sdkmanager --install "platform-tools" "platforms;android-31" "build-tools;31.0.0"
./sdkmanager --update
cd ~

# adbコマンドをWindowsから参照するようにする
cd ~/Android/platform-tools
mv adb adb-linux
ln -s /mnt/c/Users/*/AppData/Local/Android/Sdk/platform-tools/adb.exe adb

# workspaceの作成
cd ~
mkdir workspace
