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
