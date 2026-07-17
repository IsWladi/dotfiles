return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-context", branch = "master" },
			{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
		},
		config = function()
			require("nvim-treesitter").setup({})
			require("nvim-treesitter").install({
				"vimdoc",
				"javascript",
				"python",
				"lua",
				"luadoc",
				"html",
				"yaml",
				"json",
				"markdown",
				"regex",
				"java",
				"csv",
				"rust",
				"nix",
				"bash",
				"diff",
				"markdown_inline",
				"gdscript",
				"gdshader",
			})

			-- Enable treesitter highlighting for all filetypes with a parser
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})

			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
				},
			})

			local select = require("nvim-treesitter-textobjects.select")
			local keymaps = {
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["ad"] = "@comment.outer",
				["id"] = "@comment.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
			}
			for key, capture in pairs(keymaps) do
				vim.keymap.set({ "x", "o" }, key, function()
					select.select_textobject(capture, "textobjects")
				end)
			end
		end,
	},
}

--doc

--textobjects.select: Este módulo te permite seleccionar objetos de texto específicos en tu código.
--
--af: Selecciona la función que está alrededor del cursor.
--if: Selecciona la función que está dentro del cursor.
--ac: Selecciona la clase que está alrededor del cursor.
--ic: Selecciona la clase que está dentro del cursor.

--textobjects.move: Este módulo te permite moverte entre objetos de texto específicos en tu código.
--
--goto_next_start: Mueve el cursor al inicio del siguiente objeto de texto.
--]m: Mueve el cursor al inicio de la siguiente función.
--]]: Mueve el cursor al inicio de la siguiente clase.
--goto_previous_start: Mueve el cursor al inicio del objeto de texto anterior.
--[m: Mueve el cursor al inicio de la función anterior.
-- [[: Mueve el cursor al inicio de la clase anterior.
