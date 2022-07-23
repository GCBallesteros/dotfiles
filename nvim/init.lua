require "plugins"
require "settings"
require("colors/" .. require("config").colorscheme)

vim.g.python3_host_prog = vim.fn.resolve(require("config").python3_host .. "/python")
