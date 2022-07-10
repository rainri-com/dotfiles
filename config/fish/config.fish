# cd
alias ..="cd .."
alias ..1=".."
alias ..2=".. && .."
alias ..3=".. && .. && .."
alias ..4=".. && .. && .. && .."
alias ..5=".. && .. && .. && .. && .."
alias ..6=".. && .. && .. && .. && .. && .."

# ls
alias ll="ls -lG"
alias la="ls -laG"

# cp
alias cp="cp -p"

# rm
alias rm="rm -i"

# mv
alias mv="mv -i"

# tmux
tmux

# asdf
source ~/.asdf/asdf.fish

# vim
alias vi='vim'

# ReactNative
set JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
set ANDROID_HOME $HOME/Android
set PATH $PATH $JAVA_HOME/bin $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools
alias react-native-start="yarn start --host 127.0.0.1"
alias react-native-android="yarn android --variant=debug --deviceId emulator-5554"

# bundle
alias bundle-install="bundle install --path vendor/bundle"
alias bundle-exec="bundle exec"

# workspace
alias ws='cd ~/workspace'
