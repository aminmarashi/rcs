# LazyVim customizations

This directory contains personal options and plugin overrides and enables the
TypeScript and Rust extras for an existing LazyVim configuration.

Copy the customizations into the LazyVim configuration's `lua` directory (merge
`lua/config/options.lua` if you already have custom options):

```sh
cp -R lazyvim/lua/. ~/.config/nvim/lua/
```

Enable `lang.typescript` and `lang.rust` with `:LazyExtras`. For a new LazyVim
configuration, you can copy `lazyvim/lazyvim.json` to `~/.config/nvim/` instead.
Rust support also requires `rust-analyzer` on your `PATH`.

Then start the configuration with:

```sh
nvim
```

The options in `lua/config/options.lua` disable animations and relative line
numbers on every startup. Absolute line numbers remain enabled.

The Flash override in `lua/plugins/flash.lua` disables the default `s` and
`S` mappings and assigns `?` to Flash Search in normal, visual, and operator-
pending modes.
