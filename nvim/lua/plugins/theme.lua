return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		config = function()
			vim.cmd.colorscheme("catppuccin-macchiato")
			require("catppuccin").setup({
				transparent_background = true,
			})

			function ColorMyPencils(color)
				color = color or "catppuccin"
				vim.cmd.colorscheme(color)

				vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end

			ColorMyPencils()
		end,
	},
}
