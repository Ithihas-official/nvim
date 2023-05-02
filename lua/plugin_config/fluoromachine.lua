local fm = require("fluoromachine")
-- theme: 'retrowave' and 'fluoromachine'
fm.setup({
	glow = true,
	theme = "fluoromachine",
	transparent = "full",
	overrides = {
		["@type"] = { italic = true, bold = false },
		["@function"] = { italic = false, bold = true },
		["@comment"] = { italic = true },
		["@keyword"] = { italic = false },
		["@constant"] = { italic = false, bold = false },
		["@variable"] = { italic = true },
		["@field"] = { italic = true },
		["@parameter"] = { italic = true },
	},
})
