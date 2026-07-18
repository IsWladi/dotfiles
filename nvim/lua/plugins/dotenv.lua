return {
	"tpope/vim-dotenv",
	event = "VimEnter",
	config = function()
		vim.cmd("Dotenv ~/.config/nvim/.env")
	end,
}
