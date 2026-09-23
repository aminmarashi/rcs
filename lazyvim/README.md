# LazyVim customizations

This directory contains personal plugin overrides and enables the TypeScript
and Rust extras for an existing LazyVim configuration.

Copy the plugin override into the LazyVim configuration's `lua` directory:

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

The Flash override in `lua/plugins/flash.lua` disables the default `s` and
`S` mappings and assigns `?` to Flash Search in normal, visual, and operator-
pending modes.
