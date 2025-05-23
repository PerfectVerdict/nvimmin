leader = " "
vim.g.maplocalleader = " "

vim.o.hlsearch = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.expandtab = true -- Tabs become spaces
vim.opt.tabstop = 2 -- A tab is 4 spaces visually
vim.opt.shiftwidth = 4 -- Indent levels are 4 spaces
vim.opt.softtabstop = 2 -- Hitting <Tab> inserts 4 spaces
vim.opt.smartindent = true -- Auto-indent on new lines
vim.opt.autoindent = true -- Copy indent from current line
-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = { vim.fn.stdpath("state") .. "/undo" }
vim.o.wrap = false
-- Ensure the undo directory exists
local undodir = vim.fn.stdpath("state") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
vim.cmd([[
  highlight Comment guifg=#B5CEA8 ctermfg=108
]])

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
