require "plugins"
require "settings/keymap"
require "settings/options"
require "settings/autocommands"
require("colors/" .. require("config").colorscheme)
require "settings/highlights" -- needs to be called last

vim.g.python3_host_prog = vim.fn.resolve(require("config").python3_host .. "/python")
