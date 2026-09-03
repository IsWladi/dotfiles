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
			"<CR>CR",
			function()
				require("spectre").open_file_search({ select_word = false })
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
				-- Los defaults empiezan con "t" (mi tecla de abajo en rtns).
				["change_replace_sed"] = { map = "<leader>e" }, -- antes: trs
				["change_replace_oxi"] = { map = "<leader>E" }, -- antes: tro
				["toggle_live_update"] = { map = "<leader>u" }, -- antes: tu
				["toggle_ignore_case"] = { map = "<leader>i" }, -- antes: ti
				["toggle_ignore_hidden"] = { map = "<leader>h" }, -- antes: th
				-- ,q es mi keymap global de salir.
				["send_to_qf"] = { map = "<leader>Q" }, -- antes: <leader>q
				-- ,o es mi keymap global de guardar.
				["show_option_menu"] = { map = "<leader>O" }, -- antes: <leader>o
				-- ,r es mi ventana izquierda; estos encadenaban con ella.
				["run_current_replace"] = { map = "<leader>C" }, -- antes: <leader>rc
				["select_template"] = { map = "<leader>P" }, -- antes: <leader>rp
				["delete_line"] = { map = "<leader>D" }, -- antes: <leader>rd
			},
		})
	end,
}
