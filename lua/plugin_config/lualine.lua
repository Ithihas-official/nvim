-- local function ithihas()
-- 	return [[〔Ithihas〕✒]]
-- end

--  ROUNDED THEME
--
--
require("lualine").setup({
	options = {
		icons_enabled = true,
		disabled_filetypes = { "packer", "NvimTree", "Aerial" },
		component_separators = " ",
		section_separators = { left = "", right = "", padding = 4 },
	},
	sections = {
		lualine_a = {
			{
				-- ithihas,
				"filename",
				separator = { left = "", right = "", padding = 4 },
			},
		},
		lualine_b = {},
		lualine_c = {

			"diagnostics",
			"branch",
			"diff",
		},
		lualine_x = {},

		lualine_y = {
			"progress",
		},
		lualine_z = {
			{ "searchcount" },
			{
				"location",
				separator = { left = "", right = "", padding = 4 },
			},
		},
	},
})
