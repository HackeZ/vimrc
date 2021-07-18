-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

	---------------------------------------------------------------
	-- COMMON PLUGINS
	---------------------------------------------------------------

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- All Neovim support lua function you can find here
	-- Also requred by other plugins, e.g.: 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'

	-- Provide an Popup API from vim in Neovim
	use 'nvim-lua/popup.nvim'

	-- A highly extendable fuzzy finder over lists
	use 'nvim-telescope/telescope.nvim'

	-- A search and replace pancel for Neovim
	use 'windwp/nvim-spectre'

	-- An EasyMotion-like plugin allowing you to jump anywhere in a document
	use { 'phaazon/hop.nvim', as = 'hop', config = function() require('hop').setup() end }

	-- Displays a popup with possible key bindings of the command you started typing
	use { 'folke/which-key.nvim', config = function() require('which-key').setup() end }


	---------------------------------------------------------------
	-- COLORSCHEME PLUGINS
	---------------------------------------------------------------

	-- A colorscheme helper for neovim
	use 'tjdevries/colorbuddy.vim'
	use { 'Th3Whit3Wolf/onebuddy', config = [[ vim.cmd('colorscheme  onebuddy') ]] }

	-- -- A high-performance color highlighter for Neovim
	-- use {'norcalli/nvim-colorizer.lua', config = require('colorizer').setup()}
	-- use {'p00f/nvim-ts-rainbow'}

	---------------------------------------------------------------
	-- TREESITTER PLUGINS
	---------------------------------------------------------------
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate { bash c cmake cpp dockerfile go gomod html javascript json lua python rust tsx toml vue yaml }',
		config = function() require('nvim-treesitter.configs').setup(require('plugins.nvim-treesitter')) end,
	}
	use { 'nvim-treesitter/nvim-treesitter-textobjects' }
	use { 'lewis6991/spellsitter.nvim', config = function() require('spellsitter').setup() end }


	---------------------------------------------------------------
	-- LSP / COMPLETION PLUGINS
	---------------------------------------------------------------

	-- USAGE:
	--   use :LspInstall <language> to install the lsp servers you perfer
	--------------------------------------------

	use { 'neovim/nvim-lspconfig', event = 'BufReadPre' }
	use { 'kabouzeid/nvim-lspinstall', config = function()
		require('plugins.nvim-lsp').setup_servers()

		-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
		require('lspinstall').post_install_hook = function ()
			require('plugins.nvim-lsp').setup_servers() -- reload installed servers
			vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
		end
	end}
	use { "glepnir/lspsaga.nvim", cmd = "Lspsaga" }

	-- Formatting
	use { 'mhartington/formatter.nvim', config = function() require('formatter').setup(require('plugins.formatter')) end }

	-- element style in compeletion list
	use { 'onsails/lspkind-nvim', config = function() require('lspkind').init(require('plugins.lspkind')) end }


	use {
		'hrsh7th/nvim-compe',
		event = 'InsertEnter',
		config = [[ require("plugins.nvim-compe") ]],
		requires = {
			-- {
			-- 	"hrsh7th/vim-vsnip",
			-- 	event = "InsertCharPre",
			-- 	config = [[ require("plugins.vsnip") ]],
			-- 	requires = {
			-- 		{"dsznajder/vscode-es7-javascript-react-snippets"},
			-- 		{"xabikos/vscode-javascript"},
			-- 		{"hollowtree/vscode-vue-snippets"},
			-- 	},
			-- },
			-- { "hrsh7th/vim-vsnip-integ", event = "InsertCharPre" },
			{ "kristijanhusak/vim-dadbod-completion", event = "InsertCharPre" },
			{ "tzachar/compe-tabnine", event = "InsertCharPre", run = "./install.sh" },
		}
	}


	---------------------------------------------------------------
	-- BUFFER PLUGINS ( fileexplorer | statusline | translator)
	---------------------------------------------------------------

	-- A file explorer for Neovim
	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
		setup = [[vim.g.nvim_tree_side = 'right']],
	}

	-- A light-weight and Super Fast statusline plugin for Neovim
	use {
		'glepnir/galaxyline.nvim', branch = 'main',
		-- your statusline
		config = function() require'plugins.eviline' end,
		-- some optional icons
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- A snazzy nail_care buffer line (with minimal tab integration) for Neovim
	use {
		'akinsho/nvim-bufferline.lua',
		config = function() require('bufferline').setup(require('plugins.nvim-bufferline')) end,
	}

	-- Translator
	use { 'voldikss/vim-translator' }

	-- For better glance at matched information, seamlessly jump between matched instances.
	use { 'kevinhwang91/nvim-hlslens' }

	-- -- Persist and toggle multiple terminals during an editing session
	-- use {
	-- 	'akinsho/nvim-toggleterm.lua', config = function()
	-- 	require('toggleterm').setup(require('plugins.nvim-toggleterm')) end
	-- }


	---------------------------------------------------------------
	-- GIT PLUGINS
	---------------------------------------------------------------
	use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }
	use { 'kdheepak/lazygit.nvim'}
	use { 'sindrets/diffview.nvim', config = function() require('diffview').setup(require('plugins.diffview')) end}

	---------------------------------------------------------------
	-- COMMENT PLUGINS
	---------------------------------------------------------------

	use {'b3nj5m1n/kommentary'}
	--  highlight and search for todo comments like TODO, HACK, BUG in your code base.
	--  OPTION FLAGS: PERF | HACK | TODO | NOTE | FIX | WARNING
	use {'folke/todo-comments.nvim', config = function() require('todo-comments').setup{} end}
end)
