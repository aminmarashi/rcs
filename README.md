# rcs

Personal dotfiles: vim configuration plus
[LazyVim](https://www.lazyvim.org/) customizations.

```
README.md     this file
vimrc         the vim config (-> ~/.vimrc)
nvim/         shim so plain nvim reuses ~/.vimrc
lazyvim/      LazyVim customizations
```

## Plain vim

1. Copy or symlink the config into place:
   ```sh
   ln -sf "$PWD/vimrc" ~/.vimrc
   ```
2. Install [vim-plug](https://github.com/junegunn/vim-plug):
   ```sh
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```
3. Open vim and install the plugins:
   ```vim
   :PlugInstall
   ```

## Plain nvim (optional)

To make a plain `nvim` reuse the same `~/.vimrc`, copy the shim into place:

```sh
mkdir -p ~/.config/nvim
cp nvim/init.vim ~/.config/nvim/init.vim
```

## LazyVim

The `lazyvim/` directory contains custom plugin overrides for an existing
LazyVim configuration. Copy its `lua` directory into that configuration:

```sh
cp -R lazyvim/lua/. ~/.config/nvim/lua/
```

Start Neovim normally, or use the `NVIM_APPNAME` assigned to your LazyVim
configuration.
