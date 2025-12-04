return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = false },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	config = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1

		vim.g.dbs = {
			{ name = "proyex_local_api_mul_tablas", url = vim.fn.getenv("PROYEX_DB") },
		}
	end,
}
