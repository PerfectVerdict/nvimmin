require("settings")
require("plugins")
require("mappings")
require("colorscheme")
require("bufferline").setup({})

-- vim.cmd.colorscheme("alduin")
--vim.cmd[[colorscheme jellybeans]]
--vim.cmd("colorscheme citruszest")
-- vim.cmd("colorscheme miasma")
vim.cmd("colorscheme citruszest")

require("telescope").load_extension("scope")
require("telescope").setup({
	defaults = {
		borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
		winblend = 10, -- Adjust this for more or less transparency
	},
})
vim.opt.termguicolors = true
vim.cmd([[
augroup CustomHighlights
  autocmd!
  autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
  autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
  autocmd ColorScheme * highlight Search guibg=yellow guifg=black
  autocmd ColorScheme * highlight IncSearch guibg=yellow guifg=black
  autocmd ColorScheme * highlight Visual guibg=yellow guifg=black
augroup END
]])

-- Telescope-specific
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })

-- MiniFiles (if using mini.nvim)
vim.api.nvim_set_hl(0, "MiniFilesNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "MiniFilesBorder", { bg = "none" })

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight NormalFloat guibg=NONE ctermbg=NONE
  highlight Pmenu guibg=NONE ctermbg=NONE
]])
