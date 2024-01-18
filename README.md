# Installation

Backup and Remove your local cache if you have a previusly nvim configuration:

```
mv ~/.config/nvim ~/.config/nvim.backup
rm -rf ~/.local/share/nvim
```


First install packer from:https://github.com/wbthomason/packer.nvim

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then open nvim and do PackerSync
