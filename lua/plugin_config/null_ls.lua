local null_ls = require("null-ls")

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		-- filter = function(clients)
		-- filter out clients that you don't want to use
		-- return vim.tbl_filter(function(client)
		-- return client.name ~= "tsserver"
		-- end, clients)
		-- end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
	debug = true,
	sources = {

		null_ls.builtins.diagnostics.yamllint,
		null_ls.builtins.diagnostics.markdownlint,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.selene,
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.formatting.google_java_format,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"jsonc",
				"yaml",
				"markdown",
				"markdown.mdx",
				"graphql",
				"handlebars",
			},
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
