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
	keys = {
		{ "<leader>bd", ":tab DBUIToggle<cr>", desc = "dadbod-ui: Toggle DBUI" },
	},
	config = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1

		vim.g.dbs = {
			{ name = "local_proyex_api_mul_tablas", url = vim.fn.getenv("PROYEX_DB") },
			{ name = "Local Proyex Mysql 3307", url = vim.fn.getenv("MY_SQL_3307") },
			{ name = "Local Proyex Mysql 3308", url = vim.fn.getenv("MY_SQL_3308") },
		}
	end,
}
