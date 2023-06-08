local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

require("lualine").setup({
	options = {
		icons_enabled = true,
		disabled_filetypes = { "packer", "NvimTree", "Aerial" },
		component_separators = "",
	},
	sections = {
		lualine_a = {
			{
				"filename",
				cond = conditions.buffer_not_empty,
				separator = { left = "", right = "" },
			},
		},
		lualine_b = {
			{
				"branch",
				separator = { right = "" },
			},
		},
		lualine_c = {
			{
				"diff",
				symbols = { added = " ", modified = "󰝤 ", removed = " " },
				cond = conditions.hide_in_width,
			},
		},
		lualine_x = {

			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
			},
		},

		lualine_y = {
			{
				"searchcount",
				separator = { left = "" },
			},
			{
				"progress",
				separator = { left = "" },
			},
		},
		lualine_z = {

			{
				"location",
				separator = { left = "", right = "" },
			},
		},
	},
})
