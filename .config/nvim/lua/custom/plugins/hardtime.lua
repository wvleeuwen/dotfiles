vim.pack.add{"https://github.com/m4xshen/hardtime.nvim"}

require("hardtime").setup({
	disabled_keys = {
		-- Allow arrow keys because of Colemak Corne
		["<Up>"] = false,
		["<Down>"] = false,
		["<Left>"] = false,
		["<Right>"] = false,
	},
})




