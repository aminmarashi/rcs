# LazyVim customizations

This directory contains personal plugin overrides for the LazyVim setup in
`nvim-lazy`.

To use these files, copy or link the contents of this directory into the
LazyVim configuration's `lua` directory:

```sh
cp -R lazyvim/lua/. nvim-lazy/lua/
```

Then start the configuration with:

```sh
NVIM_APPNAME=nvim-lazy nvim
```

The Flash override in `lua/plugins/flash.lua` disables the default `s` and
`S` mappings and assigns `?` to Flash Search in normal, visual, and operator-
pending modes.
