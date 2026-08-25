return {
	"stevearc/oil.nvim",
	keys = { "-" },
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = false,
			},
			-- Se fusionan con los keymaps por defecto de oil.
			keymaps = {
				-- Copia el path del archivo/carpeta bajo el cursor al registro
				-- (con clipboard=unnamedplus va también al portapapeles del sistema).
				["gy"] = "actions.yank_entry", -- path absoluto
			},
		})

		vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
	end,
}
