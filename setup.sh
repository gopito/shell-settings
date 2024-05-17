#!/bin/bash
#Устанавливаем скорость автоповтора клавиш
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)

#копируем .zprofile and .zshrc и переименовываем их с суффиксом _old
zprofile="$HOME/.zprofile"
zshrc="$HOME/.zshrc"
if [ -f "$zprofile" ]; then
    echo "$zprofile exists"
    cp $zprofile ${zprofile}_old
fi
if [ -f "$zshrc" ]; then
    echo "$zshrc exists"
    cp $zshrc ${zshrc}_old
fi
#установка brew
if ! command -v brew &>/dev/null; then
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [[ "$(uname -p)" =~ "arm" ]]
  then
    # On ARM macOS, this script installs to /opt/homebrew only
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    # On Intel macOS, this script installs to /usr/local only
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

#установка oh my zsh и копирование .zshrc из репозитория
if [ ! -d ${HOME}/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
cp zprofile ${HOME}/.zprofile
cp zshrc-file ${HOME}/.zshrc
brew bundle

#Установка темы
powerlevel10k="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d $powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $powerlevel10k
else
  echo "powerlevel10k already installed"
fi

#Установка Fast syntax highlighting
FSyH="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/F-Sy-H"
if [ ! -d $FSyH ]; then
  git clone https://github.com/z-shell/F-Sy-H.git $FSyH
else
  echo "Fast syntax highlighting already installed"
fi

#Установка zsh-autosuggestions
autosuggestions="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
if [ ! -d $autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $autosuggestions
else
  echo "zsh-autosuggestions already installed"
fi

open -a iTerm.app
open -a "Amazon Q.app"
