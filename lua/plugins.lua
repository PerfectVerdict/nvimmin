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
	require("colorscheme"),
	-- Lua
	--
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"famiu/bufdelete.nvim",
	},

	{ "tiagovla/scope.nvim", config = true },
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"numToStr/FTerm.nvim",
		config = function()
			require("FTerm").setup({
				border = "double",
				dimensions = {
					height = 0.9,
					width = 0.9,
				},
			})

			vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
			vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- config = function()
		-- 	require("lualine").setup({
		-- 		options = {
		-- 			theme = "ayu",
		-- 		},
		-- 	})
		-- end,
	},
	{ "sheerun/vim-polyglot" },
	{
		"bakpakin/fennel.vim",
		ft = "fennel",
	},

	-- File: ~/.config/nvim/lua/plugins/conjure.lua
	{
		"Olical/conjure",
		ft = { "fennel" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"java",
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
		"ThePrimeagen/harpoon",
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			-- Key mappings
			vim.keymap.set("n", "<C-a>", mark.add_file, { desc = "Add file to Harpoon" })
			vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })
			vim.keymap.set("n", "<C-h>", function()
				ui.nav_file(1)
			end)
			vim.keymap.set("n", "<C-j>", function()
				ui.nav_file(2)
			end)
			vim.keymap.set("n", "<C-k>", function()
				ui.nav_file(3)
			end)
			vim.keymap.set("n", "<C-l>", function()
				ui.nav_file(4)
			end)
		end,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},

	-- { "williamboman/mason-lspconfig.nvim", config = true },
	--
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	config = function()
	-- Using ts_ls instead of tsserver (which is deprecated)
	-- require("lspconfig").ts_ls.setup({})
	-- 		require("lspconfig").pyright.setup({})
	-- 		require("lspconfig").lua_ls.setup({
	-- 			settings = {
	-- 				Lua = {
	-- 					diagnostics = { globals = { "vim" } },
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 2000,
			},
			formatters_by_ft = {
				java = { "google-java-format" },
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				lua = { "stylua" },
				python = { "isort" },
			},
		},
	},

	{ "windwp/nvim-autopairs", config = true },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<Esc>"] = actions.close,
						},
						n = {
							["q"] = actions.close,
						},
					},
				},
			})
		end,
	},

	{ "echasnovski/mini.files", version = false },
	{ "stevearc/oil.nvim", opts = {}, dependencies = { "nvim-tree/nvim-web-devicons" } },
})
