return {
	-- { "EdenEast/nightfox.nvim" }, -- lazy
	{
		"AlessandroYorba/Alduin",
		config = function()
			vim.g.alduin_Shout_Become_Ethereal = 1
		end,
	},

	{
		"zootedb0t/citruszest.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"wtfox/jellybeans.nvim",
		lazy = false,
		priority = 1000,
		opts = {}, -- Optional
	},
	{
		"xero/miasma.nvim",
		lazy = false,
		priority = 1000,
		config = function() end,
	},
	-- { "Shatur/neovim-ayu" },
	-- "maxmx03/solarized.nvim", -- Solarized plugin
	-- lazy = false, -- Load immediately
	-- priority = 1000, -- Set high priority to load it before other color schemes
	--
	-- config = function(_, opts)
	-- 	-- Set background to dark
	-- 	vim.o.background = "dark"
	--
	-- 	-- Set up Solarized theme with the desired options
	-- 	require("solarized").setup({
	-- 		transparent = {
	-- 			enabled = false, -- Enable transparency for the background
	-- 			pmenu = true,
	-- 			normal = true,
	-- 			normalfloat = true,
	-- 			neotree = true,
	-- 			nvimtree = true,
	-- 			whichkey = true,
	-- 			telescope = true,
	-- 			lazy = true,
	-- 		},
	-- 		on_highlights = nil, -- You can customize highlights here if needed
	-- 		on_colors = nil, -- Customize colors if needed
	-- 		palette = "solarized", -- Palette option (solarized or selenized)
	-- 		variant = "winter", -- Variant option (winter | spring | summer | autumn)
	-- 		-- error_lens = {
	-- 		-- 	text = false,
	-- 		-- 	symbol = false,
	-- 		-- },
	-- 		styles = {
	-- 			enabled = true,
	-- 			types = {},
	-- 			functions = {},
	-- 			parameters = {},
	-- 			comments = {},
	-- 			strings = {},
	-- 			keywords = {},
	-- 			variables = {},
	-- 			constants = {},
	-- 		},
	-- 		plugins = {
	-- 			treesitter = true,
	-- 			-- lspconfig = true,
	-- 			navic = true,
	-- 			cmp = true,
	-- 			indentblankline = true,
	-- 			neotree = true,
	-- 			nvimtree = true,
	-- 			whichkey = true,
	-- 			dashboard = true,
	-- 			gitsigns = true,
	-- 			telescope = true,
	-- 			noice = true,
	-- 			hop = true,
	-- 			ministatusline = true,
	-- 			minitabline = true,
	-- 			ministarter = true,
	-- 			minicursorword = true,
	-- 			notify = true,
	-- 			rainbowdelimiters = true,
	-- 			bufferline = true,
	-- 			lazy = true,
	-- 			rendermarkdown = true,
	-- 			ale = true,
	-- 			coc = true,
	-- 			leap = true,
	-- 			alpha = true,
	-- 			yanky = true,
	-- 			gitgutter = true,
	-- 			mason = true,
	-- 			flash = true,
	-- 		},
	-- 	})
	--
	-- 	-- Apply the Solarized color scheme
	-- 	vim.cmd.colorscheme("solarized")
	-- end,
}
