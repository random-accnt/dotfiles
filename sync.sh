#!/bin/bash
rsync -av --delete --exclude "lazy-lock.json" ~/.config/nvim/ ~/dotfiles/nvim/
rsync -av --delete ~/.bash_profile ~/dotfiles/.bash_profile
rsync -av --delete ~/.bashrc ~/dotfiles/.bashrc
rsync -av --delete ~/.config/tmux/ ~/dotfiles/tmux/
rsync -av --delete ~/.zshrc ~/dotfiles/.zshrc
rsync -av --delete ~/.config/i3/ ~/dotfiles/i3/
rsync -av --delete --exclude "polybar.log" ~/.config/polybar/ ~/dotfiles/polybar/
