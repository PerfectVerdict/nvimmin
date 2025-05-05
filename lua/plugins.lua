-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("gitstuff"),

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"python",
					"javascript",
					"typescript",
					"html",
					"css",
					"json",
					"bash",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},

	{ "williamboman/mason-lspconfig.nvim", config = true },

	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Using ts_ls instead of tsserver (which is deprecated)
			require("lspconfig").ts_ls.setup({})
			require("lspconfig").pyright.setup({})
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 1000,
			},
			formatters_by_ft = {
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				lua = { "stylua" },
				python = { "black" },
			},
		},
	},

	{ "windwp/nvim-autopairs", config = true },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "echasnovski/mini.files", version = false },
	{ "stevearc/oil.nvim", opts = {}, dependencies = { "nvim-tree/nvim-web-devicons" } },
})
