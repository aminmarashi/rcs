# rcs

Personal dotfiles: vim configuration plus a vendored
[LazyVim](https://www.lazyvim.org/) setup, so the whole editor environment
reproduces on a new machine.

```
README.md     this file
vimrc         the vim config (-> ~/.vimrc)
nvim/         shim so plain nvim reuses ~/.vimrc
nvim-lazy/    full LazyVim config (run via NVIM_APPNAME=nvim-lazy)
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

The `nvim-lazy/` directory is a self-contained LazyVim config. Install it
under its own [`NVIM_APPNAME`](https://neovim.io/doc/user/starting.html#$NVIM_APPNAME)
so it does not clash with a plain nvim setup:

```sh
cp -R nvim-lazy ~/.config/nvim-lazy
NVIM_APPNAME=nvim-lazy nvim
```

On first launch LazyVim restores the exact pinned plugin versions from
`nvim-lazy/lazy-lock.json`. To keep `NVIM_APPNAME=nvim-lazy` out of every
invocation, add an alias to your shell rc:

```sh
alias lvim='NVIM_APPNAME=nvim-lazy nvim'
```
