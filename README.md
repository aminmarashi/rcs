# rcs

Personal dotfiles: vim configuration,
[LazyVim](https://www.lazyvim.org/) customizations, and revdiff defaults.

```
README.md     this file
vimrc         the vim config (-> ~/.vimrc)
nvim/         shim so plain nvim reuses ~/.vimrc
lazyvim/      LazyVim customizations
revdiff/      revdiff configuration
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

The `lazyvim/` directory contains custom options and plugin overrides and enables
the TypeScript and Rust extras for an existing LazyVim configuration. It disables
animations and relative line numbers at startup, keeping absolute line numbers.
Copy the customizations into that configuration (merge `lua/config/options.lua`
if you already have custom options):

```sh
cp -R lazyvim/lua/. ~/.config/nvim/lua/
```

Enable `lang.typescript` and `lang.rust` with `:LazyExtras`. For a new LazyVim
configuration, you can copy `lazyvim/lazyvim.json` to `~/.config/nvim/` instead.
Rust support also requires `rust-analyzer` on your `PATH`.

Start Neovim normally, or use the `NVIM_APPNAME` assigned to your LazyVim
configuration.

## revdiff

The `revdiff/config` file hides the file tree sidebar at startup. For a new
configuration:

```sh
mkdir -p ~/.config/revdiff
cp revdiff/config ~/.config/revdiff/config
```

If a configuration already exists, merge `no-tree = true` into it to preserve
other settings such as the theme. Press `t` to toggle the sidebar during a review.
