## Installation:
```
git clone git@github.com:mtift/dotvim.git ~/.vim
```

## Create symlinks:
```
ln -s ~/.vim/vimrc ~/.vimrc
```

## Switch to the `~/.vim` directory, and fetch submodules:
```
cd ~/.vim
git submodule init
git submodule update
```

## Adding submodules:
```
cd ~/.vim
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
add the line 'ignore = dirty' to the .gitmodules file for each submodule
git submodule init
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```


