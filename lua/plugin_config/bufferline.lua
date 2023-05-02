require("bufferline").setup({
	options = {
		indicator = {
			style = "icon",
		},
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
		separator_style = "slope",
	},
})

-- "slant" | "slope" | "thick" | "thin" |
