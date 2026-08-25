return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,

	config = function()
		-- setup each of the snacks modules
		local Snacks = require("snacks")
		Snacks.setup({
			picker = { enabled = true },
			quickfile = { enabled = true },
			image = { enabled = true },
			dim = { enabled = true },
			indent = { enabled = true },
			words = { enabled = true },
		})

		-- Dim toggle
		local dim_enabled = false

		vim.api.nvim_create_user_command("Dim", function()
			if dim_enabled then
				require("snacks").dim.disable()
			else
				require("snacks").dim.enable()
			end
			dim_enabled = not dim_enabled
		end, {})
	end,

	keys = {
		-- Top Pickers & Explorer
		{
			"<CR>f",
			function()
				Snacks.picker.files({ hidden = false, ignored = false })
			end,
			desc = "Find Files",
		},
		{
			"<CR>g",
			function()
				Snacks.picker.grep({ hidden = false })
			end,
			desc = "Grep",
		},
		{
			"<CR>k",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<CR>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<CR>w",
			function()
				Snacks.picker.grep_word({ hidden = true })
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},

		-- LSP Pickers
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gt",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto Type Definition",
		},
		{
			"gi",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto implementation",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "LSP references",
		},
		{
			"gci",
			function()
				Snacks.picker.lsp_incoming_calls()
			end,
			desc = "C[a]lls Incoming",
		},
		{
			"gco",
			function()
				Snacks.picker.lsp_outgoing_calls()
			end,
			desc = "C[a]lls Outgoing",
		},
		{
			"<CR>s",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Document Symbols",
		},
		{
			"<CR><CR>",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "LSP Diagnostics Buffer",
		},

		{
			"<CR>b",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Open Buffers",
		},
		{
			"<CR>h",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			'<CR>"',
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			",m",
			function()
				Snacks.words.jump(vim.v.count1, true)
			end,
			desc = "Next word reference",
		},
		{
			",M",
			function()
				Snacks.words.jump(-vim.v.count1, true)
			end,
			desc = "Prev word reference",
		},
	},
}
