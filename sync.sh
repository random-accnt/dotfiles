#!/bin/bash
rsync -av --delete --exclude "lazy-lock.json" ~/.config/nvim/ ~/dotfiles/nvim/
rsync -av --delete ~/.bash_profile ~/dotfiles/.bash_profile
rsync -av --delete ~/.bashrc ~/dotfiles/.bashrc
rsync -av --delete ~/.tmux/tmux.conf ~/dotfiles/.tmux/tmux.conf
rsync -av --delete ~/.zshrc ~/dotfiles/.zshrc
