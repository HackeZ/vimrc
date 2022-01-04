-- Thanks to:
--   - https://github.com/HeWenJin/config/
--   - https://github.com/voitd/dotfiles
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
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {
        'nvim-telescope/telescope.nvim',
        config = function() require'telescope'.load_extension('fzf') end
    }

    -- A search and replace pancel for Neovim
    use 'windwp/nvim-spectre'

    -- An EasyMotion-like plugin allowing you to jump anywhere in a document
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function() require('hop').setup() end
    }

    -- Displays a popup with possible key bindings of the command you started typing
    use {
        'folke/which-key.nvim',
        config = function() require('which-key').setup() end
    }

    use {'glepnir/dashboard-nvim'}

    use {"junegunn/fzf", run = "./install --all"}
    use {"junegunn/fzf.vim"}

    ---------------------------------------------------------------
    -- COLORSCHEME PLUGINS
    ---------------------------------------------------------------

    -- A colorscheme helper for neovim
    -- use 'tjdevries/colorbuddy.vim'
    -- use { 'Th3Whit3Wolf/onebuddy', config = [[ vim.cmd('colorscheme  onebuddy') ]] }
    -- use { 'Yagua/nebulous.nvim', config = function() require("nebulous").setup() end }

    -- A dark and light Neovim theme written in Lua ported from the Visual Studio Code TokyoNight theme
    use {
        'folke/tokyonight.nvim',
        config = [[ vim.cmd('colorscheme tokyonight')]]
    }

    -- -- A high-performance color highlighter for Neovim
    -- use {'norcalli/nvim-colorizer.lua', config = require('colorizer').setup()}
    -- use {'p00f/nvim-ts-rainbow'}

    ---------------------------------------------------------------
    -- TREESITTER PLUGINS
    ---------------------------------------------------------------
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate { bash c cmake cpp dockerfile go gomod html javascript json lua python rust tsx toml vue yaml }',
        config = function()
            require('nvim-treesitter.configs').setup(require(
                                                         'plugins.nvim-treesitter'))
        end
    }
    use {'nvim-treesitter/nvim-treesitter-textobjects'}
    use {
        'lewis6991/spellsitter.nvim',
        config = function() require('spellsitter').setup() end
    }

    ---------------------------------------------------------------
    -- LSP / COMPLETION PLUGINS
    ---------------------------------------------------------------

    -- USAGE:
    --   use `:LspInstall <language>` to install the lsp servers what you perfer
    --------------------------------------------

    use {'neovim/nvim-lspconfig'}
    use {
        'williamboman/nvim-lsp-installer',
        config = function() require('plugins.nvim-lsp').setup_servers() end
    }
    use {"glepnir/lspsaga.nvim", cmd = "Lspsaga"}

    -- Formatting
    use {
        'mhartington/formatter.nvim',
        config = function()
            require('formatter').setup(require('plugins.formatter'))
        end
    }

    -- element style in compeletion list
    use {
        'onsails/lspkind-nvim',
        config = function()
            require('lspkind').init(require('plugins.lspkind'))
        end
    }

    -- A completion engine plugin for Neovim written in Lua
    use {'rafamadriz/friendly-snippets'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}
    use {'hrsh7th/cmp-vsnip'}
    use {'octaltree/cmp-look'}
    use {'hrsh7th/nvim-cmp', config = require('plugins.nvim-cmp')}

    ---------------------------------------------------------------
    -- BUFFER PLUGINS ( fileexplorer | statusline | translator)
    ---------------------------------------------------------------

    -- A file explorer for Neovim
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require('nvim-tree').setup {view = {side = 'right'}}
        end
    }

    -- A light-weight and Super Fast statusline plugin for Neovim
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        -- your statusline
        config = function() require 'plugins.eviline' end,
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- A snazzy nail_care buffer line (with minimal tab integration) for Neovim
    use {
        'akinsho/nvim-bufferline.lua',
        config = function()
            require('bufferline').setup(require('plugins.nvim-bufferline'))
        end
    }

    -- Translator
    use {'voldikss/vim-translator'}

    -- For better glance at matched information, seamlessly jump between matched instances.
    use {'kevinhwang91/nvim-hlslens'}

    -- Adds indentation guides to all lines (including empty lines).
    use {'lukas-reineke/indent-blankline.nvim'}

    -- -- Persist and toggle multiple terminals during an editing session
    -- use {
    -- 	'akinsho/nvim-toggleterm.lua', config = function()
    -- 	require('toggleterm').setup(require('plugins.nvim-toggleterm')) end
    -- }

    ---------------------------------------------------------------
    -- GIT PLUGINS
    ---------------------------------------------------------------
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {current_line_blame = true}
        end
    }
    use {'kdheepak/lazygit.nvim'}
    use {
        'sindrets/diffview.nvim',
        config = function()
            require('diffview').setup(require('plugins.diffview'))
        end
    }

    ---------------------------------------------------------------
    -- COMMENT PLUGINS
    ---------------------------------------------------------------

    -- Neovim plugin to comment text in and out, written in lua. Supports
    -- commenting out the current line, a visual selection and a motion.
    use {
        'b3nj5m1n/kommentary',
        config = function()
            require('kommentary.config').configure_language("default", {
                prefer_single_line_comments = true
            })
        end
    }

    -- highlight and search for todo comments like TODO, HACK, BUG in your code base.
    -- OPTION FLAGS:
    -- PERF:
    -- HACK:
    -- TODO:
    -- NOTE:
    -- FIX:
    -- WARNING:
    use {
        'folke/todo-comments.nvim',
        config = function() require('todo-comments').setup {} end
    }

    --  Auto-pairs for Neovim
    use {'windwp/nvim-autopairs', config = require('plugins.autopairs')}
end)
