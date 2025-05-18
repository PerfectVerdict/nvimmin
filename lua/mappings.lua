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
	local current_file = vim.api.nvim_buf_get_name(0)
	local file_dir = vim.fn.fnamemodify(current_file, ":p:h")
	require("mini.files").open(file_dir)
end, { desc = "MiniFiles (current file dir)" })
-- Close current buffer using bufdelete (plugin)
vim.api.nvim_set_keymap("n", "<A-c>", ":bd<CR>", { noremap = true, silent = true })

-- Telescope
vim.keymap.set("n", "<leader><leader>", require("telescope.builtin").buffers, { desc = "[F]ind [B]uffer" })
vim.api.nvim_set_keymap("n", "<Space><Space>", "<Cmd>Telescope scope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>ff", "<Cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>fg", "<Cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Space>fc", function()
	require("telescope.builtin").find_files({
		prompt_title = "Neovim Config",
		cwd = vim.fn.stdpath("config"),
	})
end, { desc = "Telescope (nvim config)" })

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

vim.api.nvim_set_keymap("n", "<leader>p", ":!tmux new-session -d sioyek %<CR>", { noremap = true, silent = true })

-- Move cursor in insert mode with Ctrl + hjkl
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- Cycle through buffers
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
map("n", "<A-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- Move buffers left/right (Alt+h/l)
map("n", "<A-l>", ":BufferLineMoveNext<CR>", opts)
map("n", "<A-h>", ":BufferLineMovePrev<CR>", opts)
-- Cycle through buffers
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- Move buffers left/right (Alt+h/l)
map("n", "<A-l>", ":BufferLineMoveNext<CR>", opts)
map("n", "<A-h>", ":BufferLineMovePrev<CR>", opts)
