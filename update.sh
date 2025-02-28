#!/bin/bash
rsync -av --delete --exclude "lazy-lock.json" ~/dotfiles/nvim/ ~/.config/nvim/ 
rsync -av --delete ~/dotfiles/.bash_profile ~/.bash_profile 
rsync -av --delete ~/dotfiles/.bashrc ~/.bashrc 
rsync -av --delete ~/dotfiles/tmux/ ~/.config/tmux/ 
rsync -av --delete ~/dotfiles/.zshrc ~/.zshrc 
rsync -av --delete ~/dotfiles/i3/ ~/.config/i3/ 
rsync -av --delete --exclude "polybar.log" ~/dotfiles/polybar/ ~/.config/polybar/ 

