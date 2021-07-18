-- neovim config for version 0.5.0 or latest only

-- global setting for neovim
vim.g.mapleader = ","
vim.opt.termguicolors = true
vim.o.number = true -- enable display line number
vim.o.laststatus = 2
vim.bo.shiftwidth = 4

local execute = vim.api.nvim_command
local fn = vim.fn

-- auto install plugins manager tools if not exists
local plugins_manager_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(plugins_manager_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', plugins_manager_path})
	execute 'packadd packer.nvim'
end

require('plugins') -- loads plugins/init.lua
require('keymaps') -- loads keymaps/init.lua
