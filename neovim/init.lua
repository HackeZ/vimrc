-- neovim config for version 0.5.0 or latest only

-- global setting for neovim
vim.g.mapleader = ","
vim.opt.termguicolors = true
vim.o.number = true -- enable display line number
vim.o.cmdheight = 2
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.colorcolumn = "80" -- too long highlight hint
vim.o.splitbelow = true
vim.o.splitright = true

-- the thing between spaces and tabs
-- vim.bo.expandtab = true -- use spaces instead of tab
vim.bo.shiftwidth = 4 -- 1 tab => 4 whitspace
vim.bo.tabstop = 4 -- effect tab show width
vim.o.smarttab = true

-- enable clipboard shared as default
vim.o.clipboard = 'unnamedplus'

-- completion option
vim.o.completeopt = "menu,menuone,noselect,noinsert"
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.pumheight = 10

-- disallows to create the backup files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

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

-- format on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.go,*.rs,*.lua FormatWrite
augroup END
]], true)
