return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			options = {
				multilines = {
					enabled = true,
				},
				show_source = {
					enabled = true,
					if_many = true,
				},
				overflow = {
					mode = "wrap", -- "wrap": split into lines, "none": no truncation, "oneline": keep single line
					padding = 0, -- Extra characters to trigger wrapping earlier
				},
			},
		})
		vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
	end,
}
