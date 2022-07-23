-- # Preamble
-- External requirements
-- - fzy-lua-native (https://github.com/romgrk/fzy-lua-native)
-- - ripgrep        (https://github.com/BurntSushi/ripgrep)
-- - fd             (https://github.com/sharkdp/fd)
-- - black
-- - stylua

require "plugins"

-- Keymaps and editor options
require "settings/keymap"
require "settings/options"
require "settings/autocommands"

-- Colorscheme: neon / tokyonight / catppuccin / material
local colorscheme = "material"
require("colors/" .. colorscheme)
require "settings/highlights" -- needs to be called last

------------
-- Python --
------------
local HOME = vim.env.HOME
vim.g.python3_host_prog = HOME .. "/.pyenv/versions/neovim3/bin/python"
