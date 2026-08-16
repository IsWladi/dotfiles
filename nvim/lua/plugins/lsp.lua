return {
	--lsp para autocompletado
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			require("mason").setup()

			local mlsp = require("mason-lspconfig")

			local servers = {
				"ts_ls",
				"tailwindcss",
				"jsonls",
				"dockerls",
				"yamlls",
				"html",
				"jdtls",
			}

			mlsp.setup({
				ensure_installed = servers,
				automatic_enable = { exclude = { "jdtls" } },
			})

			local caps = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("*", {
				capabilities = caps,
			})

			-- on_attach + keymaps ------------
			local function my_on_attach(_, bufnr)
				local hover = "[LSP] Hover"
				local diagnostic_next = "[LSP] Diagnostic next"
				local diagnostic_prev = "[LSP] Diagnostic previus"
				local rename = "[LSP] Rename"
				local code_action = "[LSP] Code Action"

				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, { buffer = bufnr, remap = false, desc = hover })
				vim.keymap.set("n", "<CR>e", function()
					vim.diagnostic.jump({ count = 1, float = false })
				end, { buffer = bufnr, remap = false, desc = diagnostic_next })
				vim.keymap.set("n", "<CR>E", function()
					vim.diagnostic.jump({ count = -1, float = false })
				end, { buffer = bufnr, remap = false, desc = diagnostic_prev })
				vim.keymap.set("n", "<CR>r", function()
					vim.lsp.buf.rename()
				end, { buffer = bufnr, remap = false, desc = rename })
				vim.keymap.set("n", "<CR>ca", function()
					vim.lsp.buf.code_action()
				end, { buffer = bufnr, remap = false, desc = code_action })
			end

			vim.api.nvim_create_autocmd("LspAttach", {

				callback = function(args)
					my_on_attach(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
				end,
			})

			-- overrides
			vim.lsp.config("tailwindcss", {
				filetypes = { "css" },
			})

			-- nix managed

			vim.lsp.config("lua_ls", {
				cmd = { "lua-language-server" },
				settings = { Lua = { diagnostics = { globals = { "vim" } } } },
			})

			vim.lsp.config("nil_ls", {
				cmd = { "nil" }, -- usa el binario nativo de Nix
				settings = {
					["nil"] = {
						formatting = {
							command = { "nixpkgs-fmt" }, -- opcional si usas nixpkgs-fmt
						},
					},
				},
			})

			vim.lsp.config("pyright", {
				cmd = { "pyright-langserver", "--stdio" },
				capabilities = require("blink.cmp").get_lsp_capabilities(),
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
						},
					},
				},
			})
			vim.lsp.config("rust_analyzer", {
				cmd = { "rust-analyzer" },
				capabilities = require("blink.cmp").get_lsp_capabilities(),
				settings = {
					["rust-analyzer"] = {
						-- No forzar allFeatures: en proyectos con features
						-- mutuamente excluyentes (p.ej. mysql/oracle) activaría
						-- ambas y dispararía compile_error!. Las features por
						-- proyecto se eligen vía rust-analyzer.toml.
						checkOnSave = true,
						check = {
							command = "clippy",
						},
					},
				},
			})

			vim.lsp.config("gdscript", {
				capabilities = caps,
				filetypes = { "gd", "gdscript" },
			})

			-- enable servers manually managed by nix
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("nil_ls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("rust_analyzer")
			vim.lsp.enable("bashls")
			vim.lsp.enable("gdscript")
		end,
	},
}
