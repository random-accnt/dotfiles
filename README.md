# Dotfiles
Backup of some dotfiles.

## Usage
### Update existing
Make sync script executable:
```
chmod +x ./sync.sh
```

Sync by running:
```
./sync.sh
```

Commit and push changes

### Add new dotfile
Add new line to *sync.sh*, for example:

rsync -av --delete ~/.config/nvim/ ~/dotfiles/nvim/

Run *sync.sh*

#### Exclude files from sync
This can be achieved using the --exclude option for rsync. For example like this:

rsync -av --delete --exclude "lazy-lock.json" ~/.config/nvim/ ~/dotfiles/nvim/

More files can be added using another --exclude. You can also use wildcards (*.log, *.swp) or patterns (.DS_Store, node_modules/) in --exclude.

## TODO
- [ ] add setup script
    - copy dotfiles to correct dirs
    - handle conflicts with existing files
    - also install packages if missing??

- [ ] automation
    - automatically sync specified files / dirs when modified
    - symlink does not work, because it get's pushed to repo instead of the actual files

### Nice to have
- [ ] automated git push
- [ ] script for adding / removing files to sync
- [ ] OS independent config (for relevant pkgs like nvim)
    - can run from WSL to make it easier
