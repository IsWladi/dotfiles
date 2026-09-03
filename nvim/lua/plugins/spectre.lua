return {
	"nvim-pack/nvim-spectre",
	cmd = "Spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<CR>R",
			function()
				require("spectre").toggle()
			end,
			mode = "n",
			desc = "Spectre: search & replace (project)",
		},
		{
			"<CR>R",
			function()
				require("spectre").open_visual()
			end,
			mode = "v",
			desc = "Spectre: search selection",
		},
		{
			"<CR>Rp",
			function()
				require("spectre").open_file_search({ select_word = true })
			end,
			mode = "n",
			desc = "Spectre: search in current file",
		},
	},
	config = function()
		require("spectre").setup({
			-- Los mappings por defecto de estas acciones empiezan con "t",
			-- que es mi tecla de movimiento (abajo) en el esquema rtns, y al
			-- navegar dentro del panel de Spectre se quedaba esperando la
			-- secuencia. Los reubico a leader (,) para no chocar con rtns.
			mapping = {
				["change_replace_sed"] = { map = "<leader>e" }, -- antes: trs
				["change_replace_oxi"] = { map = "<leader>E" }, -- antes: tro
				["toggle_live_update"] = { map = "<leader>u" }, -- antes: tu
				["toggle_ignore_case"] = { map = "<leader>i" }, -- antes: ti
				["toggle_ignore_hidden"] = { map = "<leader>h" }, -- antes: th
			},
		})
	end,
}
