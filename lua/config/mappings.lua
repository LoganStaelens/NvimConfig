local map = vim.keymap.set

-- line manipulations
map("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move Up" })
map("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move Down" })
-- map("i", "<M-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("i", "<M-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })

-- terminal
map("n", "<leader>tt", function()
	Snacks.terminal()
end, { desc = "Terminal" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- windows
map("n", "<leader>wh", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>wv", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<C-Left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-Right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-Down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-Up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- buffers
map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Close buffer" })

-- telescope
map("n", "<leader>ft", ":Telescope themes<cr>", { noremap = true, silent = true, desc = "Open Themes Picker" })
map("n", "<leader><leader>", "<cmd> Telescope find_files<cr>", { desc = "Telescope find files" })
map("n", "<leader>ff", "<cmd> Telescope live_grep<cr>", { desc = "Telescope live grep" })
map("n", "<leader>fb", "<cmd> Telescope buffers<cr>", { desc = "Telescope buffers" })
map("n", "<leader>fh", "<cmd> Telescope help_tags<cr>", { desc = "Telescope help tags" })
map("n", "<leader>fr", "<cmd> Telescope lsp_references<cr>", { desc = "LSP references" })
map("n", "<leader>fc", "<cmd> TodoTelescope<cr>", { desc = "Find TODOs, ..." })
map("n", "<leader>fn", "<cmd> Telescope notify<cr>", { desc = "Open notifications list" })

-- dap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd> DapContinue <cr>", { desc = "Start or Continue the debugger" })

--utils
map("n", "<leader>pmd", "<cmd> Markview<cr>", { desc = "Toggle Preview Markdown" })
map({ "n", "v" }, "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })

-- Git
map("n", "<leader>gg", "<cmd> Neogit<cr>", { desc = "Open NeoGit" })
map("n", "<leader>gb", "<cmd> Telescope git_branches<cr>", { desc = "Git branches" })

-- nvim
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Close Nvim" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<leader>td", function()
	vim.lsp.diagnostic.enable()
end, { desc = "Toggle diagnostics" })
