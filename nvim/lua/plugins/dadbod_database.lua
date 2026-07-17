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
		vim.g.db_ui_use_nerd_fonts = 1

		local function encode_db_url(url)
			if type(url) ~= "string" then
				return url
			end
			local prefix, password, suffix = url:match("^([%a][%w+%-.]*://[^:]+:)([^@]*)(@.+)$")
			if not prefix then
				return url
			end
			local encoded = password:gsub("([^%w%-%._~])", function(c)
				return string.format("%%%02X", string.byte(c))
			end)
			return prefix .. encoded .. suffix
		end

		vim.g.dbs = {
			-- Local
			{ name = "local_proyex_api_mul_tablas", url = encode_db_url(vim.fn.getenv("PROYEX_DB")) },
			{ name = "Local Proyex Mysql 3307", url = encode_db_url(vim.fn.getenv("MY_SQL_3307")) },
			{ name = "Local Proyex Mysql 3308", url = encode_db_url(vim.fn.getenv("MY_SQL_3308")) },

			{ name = "Local Oracle 1523 System", url = encode_db_url(vim.fn.getenv("ORACLE_1523_SYSTEM")) },
			{ name = "Local Oracle 1523 BD_SATELITAL_STVL", url = encode_db_url(vim.fn.getenv("ORACLE_1523_BD_SATELITAL_STVL")) },

			-- Production
			{ name = "Prod Proyex Windows Mysql", url = encode_db_url(vim.fn.getenv("URL_MYSQL_PROYEX_WINDOWS")) },
			{ name = "Prod Proyex Linux Mysql", url = encode_db_url(vim.fn.getenv("URL_MYSQL_PROYEX_LINUX")) },
		}
	end,
}
