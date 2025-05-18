require("settings")

require("plugins")

require("mappings")
-- init.lua
require("telescope").load_extension("scope")
require("colorscheme")
vim.opt.termguicolors = true
require("bufferline").setup({})
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
vim.cmd("colorscheme everforest")
-- Set background transparent
-- In your init.lua
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi StatusLine guibg=NONE ctermbg=NONE")
vim.cmd("hi VertSplit guibg=NONE ctermbg=NONE")
