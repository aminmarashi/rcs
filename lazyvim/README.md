# LazyVim customizations

This directory contains personal plugin overrides for an existing LazyVim
configuration.

To use these files, copy or link the contents of this directory into the
LazyVim configuration's `lua` directory:

```sh
cp -R lazyvim/lua/. ~/.config/nvim/lua/
```

Then start the configuration with:

```sh
nvim
```

The Flash override in `lua/plugins/flash.lua` disables the default `s` and
`S` mappings and assigns `?` to Flash Search in normal, visual, and operator-
pending modes.
