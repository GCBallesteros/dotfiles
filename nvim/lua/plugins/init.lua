local fn = vim.fn

-- Automatically install packer on initial startup
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_Bootstrap =
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  print "---------------------------------------------------------"
  print "Press Enter to install packer and plugins."
  print "After install -- close and reopen Neovim to load configs!"
  print "---------------------------------------------------------"
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand to reload neovim when you save this file
vim.cmd [[
   augroup packer_user_config
      autocmd!
      autocmd BufWritePost */lua/plugins/init.lua source <afile> | PackerSync
   augroup end
]]

-- Use a protected call
local present, packer = pcall(require, "packer")

if not present then
  return
end

packer.startup(function(use)
  for _, plugin in ipairs(require("plugin_list").plugins) do
    use(plugin)
  end

  if Packer_Bootstrap then
    require("packer").sync()
  end
end)

-- Require all the plugin specific configurations
local plugin_config_folder = vim.fn.stdpath "config" .. "/lua/plugins/configs"
for _, file in ipairs(vim.fn.readdir(plugin_config_folder, [[v:val =~ '\.lua$']])) do
  require("plugins/configs/" .. file:gsub("%.lua$", ""))
end

-- Wilder is configured in vimscript so it breaks the pattern
vim.cmd "source ~/.config/nvim/lua/plugins/configs/wilder.vim"
