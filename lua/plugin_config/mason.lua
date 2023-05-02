require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"denols",
		"eslint",
		"prosemd_lsp",
		"lua_ls",
		"unocss",
		"emmet_ls",
		"quick_lint_js",
		"tsserver",
		"vtsls",
		"marksman",
		"pyright",
		"tailwindcss",
		"vtsls",
		"yamlls",
	},
})

-- install prettier and prettierd for formating
-- install black and flake8 for python formatting and diagnostics
-- for lsp servers : https://github.com/williamboman/mason-lspconfig.nvim
