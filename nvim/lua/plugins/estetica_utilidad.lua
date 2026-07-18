return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	{ "nvim-lua/plenary.nvim", lazy = true },

	{ "nvim-tree/nvim-web-devicons" },
}
