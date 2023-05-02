vim.cmd("colorscheme github_dark_default")

local auto_theme_custom = require("lualine.themes.auto")
auto_theme_custom.normal.b.bg = "none"
auto_theme_custom.insert.b.bg = "none"
auto_theme_custom.visual.b.bg = "none"
auto_theme_custom.command.b.bg = "none"
auto_theme_custom.normal.c.bg = "none"
auto_theme_custom.insert.c.bg = "none"
auto_theme_custom.visual.c.bg = "none"
auto_theme_custom.command.c.bg = "none"
require("lualine").setup({ options = { theme = auto_theme_custom } })
