##!/bin/bash
##Устанавливаем скорость автоповтора клавиш
#defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
#defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)
#
##копируем .zprofile and .zshrc и переименовываем их с суффиксом _old
#zprofile="$HOME/.zprofile"
#zshrc="$HOME/.zshrc"
#if [ -f "$zprofile" ]; then
#    echo "$zprofile exists"
#    cp $zprofile ${zprofile}_old
#fi
#if [ -f "$zshrc" ]; then
#    echo "$zshrc exists"
#    cp $zshrc ${zshrc}_old
#fi
##установка brew
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#if [[ "$(uname -p)" =~ "arm" ]]
#  then
#    # On ARM macOS, this script installs to /opt/homebrew only
#    eval "$(/opt/homebrew/bin/brew shellenv)"
#  else
#    # On Intel macOS, this script installs to /usr/local only
#    eval "$(/usr/local/bin/brew shellenv)"
#  fi
#
##установка oh my zsh и копирование .zshrc из репозитория
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#cp zprofile ${HOME}/.zprofile
cp zshrc-file ${HOME}/.zshrc
#brew bundle
#
##Установка темы
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

#Установка Fast syntax highlighting
git clone https://github.com/z-shell/F-Sy-H.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/F-Sy-H

#open -a iTerm.app
#open -a "Amazon Q.app"
