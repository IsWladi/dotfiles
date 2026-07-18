-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--Map leader

local g = vim.g

g.mapleader = ","
--remap hjkl
map("n", "r", "<Left>")
map("n", "t", "<Down>")
map("n", "n", "<Up>")
map("n", "s", "<Right>")
-- rtns in visual mode
map("v", "r", "<Left>")
map("v", "t", "<Down>")
map("v", "n", "<Up>")
map("v", "s", "<Right>")
-- rtns in operator pending mode
map("o", "r", "<Left>")
map("o", "t", "<Down>")
map("o", "n", "<Up>")
map("o", "s", "<Right>")

--buffers
map("n", "<leader>q", "<cmd>q<CR>", { desc = "[no plugin] Exit" }) --salir
map("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "[no plugin] Delete current buffer" }) --borrar buffer actual
map("n", "<leader>X", "<cmd>bdelete!<CR>", { desc = "[no plugin] Force delete current buffer" }) --borrar buffer actual
map("n", "<leader>o", "<cmd>w<CR>", { desc = "[no plugin] Save" }) --guardar
map("n", "<leader><leader>o", "<cmd>wa<CR>", { desc = "[no plugin] Save all buffers" }) --guardar todos los buffers

-- window management
-- rezise
vim.keymap.set("n", "<M-n>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<M-t>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<M-r>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<M-s>", ":vertical resize +2<CR>", { silent = true })
vim.keymap.set("n", "<M-Up>", ":resize +2<CR>", { silent = true })
vim.keymap.set("n", "<M-Down>", ":resize -2<CR>", { silent = true })
vim.keymap.set("n", "<M-Left>", ":vertical resize -2<CR>", { silent = true })
vim.keymap.set("n", "<M-Right>", ":vertical resize +2<CR>", { silent = true })

-- move between windows

vim.keymap.set("n", "<leader>r", "<C-w>h", { silent = true, desc = "Window left" })
vim.keymap.set("n", "<leader>s", "<C-w>l", { silent = true, desc = "Window right" })
vim.keymap.set("n", "<leader>n", "<C-w>k", { silent = true, desc = "Window up" })
vim.keymap.set("n", "<leader>t", "<C-w>j", { silent = true, desc = "Window down" })
vim.keymap.set("n", "<C-Left>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { silent = true })

--para normal mode y visual mode, sustituciones con very very magic y posición de cursor automatica
map("n", "<leader>/", [[:%s/\v//gc<Left><Left><Left><Left>]], { desc = "[no plugin] Substitute (very magic, confirm)" })
map(
	"x",
	"<leader>/",
	[[:s/\v//gc<Left><Left><Left><Left>]],
	{ desc = "[no plugin] Substitute selection (very magic, confirm)" }
)
map("n", "<leader>//", [[:g//norm! ]], { desc = "[no plugin] Run :normal on last search matches" })

-- change tabulations
map("v", "(", "<gv", { desc = "[no plugin] Indent left and reselect" })
map("v", ")", ">gv", { desc = "[no plugin] Indent right and reselect" })

-- Paste without yanking
map("x", "p", [["_c<C-r>+<Esc>]], { desc = "[no plugin] Paste over w/o yanking" })
map("x", "P", [["_c<C-r>+<Esc>]], { desc = "[no plugin] Paste over w/o yanking" })

-- exit terminal mode
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

--bajar y subir media pagina
map("n", "<C-d>", "<C-d>zz", { desc = "[no plugin] Scroll down half a page and recenter" })
map("n", "<C-u>", "<C-u>zz", { desc = "[no plugin] Scroll up half a page and recenter" })
--buscar y centrar con m en vez de n
map("n", "m", "nzzzv", { desc = "[no plugin] Next match + center" })
map("n", "M", "Nzzzv", { desc = "[no plugin] Prev match + center" })

map("n", "<Esc>", "<cmd>nohlsearch|normal! <C-L><CR>", { desc = "[no plugin] Clear search highlight and redraw" })
