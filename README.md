# Dotfiles
Backup of some dotfiles.

## Usage
### Update existing
Make sync script executable:
```
> chmod +x ./sync.sh
```

Sync by running:
```
> ./sync.sh
```

Commit and push changes

### Add new dotfile
Add new line to *sync.sh*, for example:

rsync -av --delete ~/.config/nvim/ ~/dotfiles/nvim/

Run *sync.sh*

## TODO
[ ] add setup script
    - copy dotfiles to correct dirs
    - handle conflicts with existing files
    - also install packages if missing??
