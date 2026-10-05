# rcs

Personal dotfiles: vim configuration,
[LazyVim](https://www.lazyvim.org/) customizations, and the Hunk review setup.

```
README.md     this file
vimrc         the vim config (-> ~/.vimrc)
nvim/         shim so plain nvim reuses ~/.vimrc
lazyvim/      LazyVim customizations
hunk/         Hunk configuration
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

## Hunk

[Hunk](https://hunk.dev) is the diff viewer for agent reviews. The
`hashimoto-review` skill in `marashiai/skills` opens a review and applies numbered
notes in the order Hunk shows them, so `}` and `{` step through the notes in
sequence. Hunk's `review-note-navigator` example extension lists every note on
`F8`.

1. Install Hunk:
   ```sh
   brew install hunk
   ```
2. Install the note navigator from the Hunk release you installed (`v0.22.0`
   here):
   ```sh
   dir=~/.config/hunk/extensions/review-note-navigator
   mkdir -p "$dir"
   for file in package.json index.ts; do
     curl -fsSL "https://raw.githubusercontent.com/modem-dev/hunk/v0.22.0/examples/extensions/review-note-navigator/$file" \
       -o "$dir/$file"
   done
   ```
3. Copy the configuration into place, or merge it into an existing one:
   ```sh
   mkdir -p ~/.config/hunk
   cp hunk/config.toml ~/.config/hunk/config.toml
   ```

Hunk captures the mouse; hold Shift while selecting in Ghostty to select note
text, for example for text-to-speech.
