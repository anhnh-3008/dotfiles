#!/bin/bash

set -e

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Setup zsh
echo "Installing zsh and oh-my-zsh..."
sudo apt-get install -y zsh
if [ -d ~/.oh-my-zsh ]; then
	echo "oh-my-zsh is installed"
else
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	sudo chsh -s $(which zsh)
fi

for VAR in zsh-autosuggestions zsh-syntax-highlighting
do
	if [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/${VAR} ]; then
  	echo "$VAR is installed"
	else
		git clone https://github.com/zsh-users/${VAR} ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/${VAR}
	fi
done
