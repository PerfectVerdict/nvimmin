local map = vim.keymap.set

-- MiniFiles
-- Define get_project_root before using it
local function get_project_root()
	local cwd = vim.fn.getcwd()
	local root = vim.fn.systemlist("git -C " .. cwd .. " rev-parse --show-toplevel")[1]
	return vim.fn.filereadable(root or "") == 1 and root or cwd
end

-- Set keymap for opening MiniFiles at project root
vim.keymap.set("n", "<Space>ee", function()
	require("mini.files").open(get_project_root())
end, { desc = "MiniFiles (project root)" })

vim.keymap.set("n", "<Space>ef", function()
	require("mini.files").open()
end, { desc = "MiniFiles (cwd)" })

-- Telescope
vim.api.nvim_set_keymap("n", "<Space>ff", "<Cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>fg", "<Cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
-- Oil
map("n", "-", "<cmd>Oil<CR>", { desc = "Open Oil File Explorer" })

-- 'jk' to escape insert mode
map("i", "jk", "<Esc>")

-- MiniFiles extra mappings (in setup, not here)
require("mini.files").setup({
	mappings = {
		close = "q",
		go_in = "<CR>",
		go_out = "-",
	},
})
