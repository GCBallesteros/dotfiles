# NVIM configuration

## Additional dependencies
- [fzy-lua-native](https://github.com/romgrk/fzy-lua-native)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)

For language specific support you will need the following:
### Python
- [black](https://github.com/psf/black)
- [pyright](https://github.com/microsoft/pyright)
### Lua
- [sumneko-lua](https://github.com/sumneko/lua-language-server)
- [stylua](https://github.com/JohnnyMorganz/StyLua)
### Rust
- [rust tool chain](https://www.rust-lang.org/tools/install)

## Setting up
1. Install all __additional dependencies__ and have them on your path except
   for __black__.
2. Create a python 3 env, activate it and install in it `pynvim` and
   `black`.
3. Find the path to the env. If you are using `pyenv` it will be something
   like `~/.pyenv/versions/env_name/bin`. Copy that path into `lua/config.lua`
   without a trailing slash.

## Computer Specific Config
Computer specific settings are stored under `lua/config.lua`. When cloning
into another computer this should be the only file that needs to be
modified.

## Folder Structure
```
.
├── init.lua
├── lua
│  ├── colors
│  │  ├── catppuccin.lua
│  │  └── ... more colorschemes
│  ├── commands
│  │  ├── format_toogle.lua
│  │  └── init.lua
│  ├── config.lua
│  ├── plugin_list.lua
│  ├── plugins
│  │  ├── configs
│  │  │  ├── lsp.lua
│  │  │  ├── misc.lua
│  │  │  └── ... more configs
│  │  └── init.lua
│  └── settings
│     ├── autocommands.lua
│     ├── highlights.lua
│     ├── init.lua
│     ├── keymap.lua
│     └── options.lua
└── README.md
```

`lua/plugins/init.lua` starts packer and loads all external plugins  and
their configurations.  Plugin configurations are all in the `lua/plugins/configs` folder.
More complex plugins have their own config files, but there is also a
`misc.lua` that contains the configuration for all of those plugins that
have more trivial configs or I'm testing out and don't feel like making a
file for them just now.

In `lua/settings` we have the configuration for:
- custom highlights
- keymappings
- autocommands
- general editor settings

Finally, `lua/colors/` contains the configuration for the colorschemes that
you have installed.

## Adding plugins
New plugins are to be added on `lua/plugin_list.lua`. Each element of the
`plugin` table will be passed to a packer `use` statement. As discussed
above configurations for plugins can be either put into a separate folder in
the `lua/plugins/configs` folder or you can just extend the `misc.lua` file
also on that folder.

## Adding a colorscheme
The colorscheme field on the `lua/config.lua` file is actually interpolated
into a `require` statement that looks like:
```lua
require("colors/" .. require("config").colorscheme)
```
For any colorscheme you want to use you will have to add a corresponding
config file on `lua/colors`. At its simplest its contents are just:
```lua
vim.api.nvim_command "colorscheme colorscheme_name"
```

## ToDo
- Grab and adapt the install scripts from LunarVim
