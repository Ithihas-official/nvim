local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- markdown-preview
	-- use({
	-- 	"iamcco/markdown-preview.nvim",
	-- 	run = function()
	-- 		vim.fn["mkdp#util#install"]()
	-- 	end,
	-- })

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
	-- Themes
	use({
		"projekt0n/github-nvim-theme",
		tag = "v0.0.7",
	})
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("rebelot/kanagawa.nvim")
	use("maxmx03/fluoromachine.nvim")
	-- file-manager
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	-- statusline
	use("nvim-lualine/lualine.nvim")
	-- outline
	use("stevearc/aerial.nvim")
	--codeium
	-- use("Exafunction/codeium.vim")
	-- nvim-jdtls
	--use("mfussenegger/nvim-jdtls")
	-- lsp
	use("neovim/nvim-lspconfig") -- Required
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	-- Autocompletion
	use("hrsh7th/nvim-cmp") -- Required
	use("hrsh7th/cmp-nvim-lsp") -- Required
	use("hrsh7th/cmp-buffer") -- Optional
	use("hrsh7th/cmp-path") -- Optional
	use("saadparwaiz1/cmp_luasnip") -- Optional
	use("hrsh7th/cmp-nvim-lua") -- Optional
	-- Snippets
	use("L3MON4D3/LuaSnip") -- Required
	use("rafamadriz/friendly-snippets") -- Optional
	-- formatter
	use("nvim-treesitter/nvim-treesitter")
	-- auto highlight
	use("RRethy/vim-illuminate")
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	-- file finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- project manager
	use("ahmedkhalf/project.nvim")

	-- bufferline
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
	})
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	-- autopairing brackets
	use("windwp/nvim-autopairs")
	-- surrounding brackets and changing tags
	use("kylechui/nvim-surround")
	-- git
	use({
		"lewis6991/gitsigns.nvim",

		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})
	-- auto indent and spacing
	use("lukas-reineke/indent-blankline.nvim")
	--comments
	use("numToStr/Comment.nvim")
	--formatting,linting
	use("jose-elias-alvarez/null-ls.nvim")

	--startupscreen
	use("startup-nvim/startup.nvim")
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
