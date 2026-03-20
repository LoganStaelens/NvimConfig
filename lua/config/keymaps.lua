require("config.utils")

local map = vim.keymap.set

local disabled_mappings = {
	{ { "n" }, "<C-W>s" },
	{ { "n" }, "<C-W>v" },
	{ { "n" }, "<C-W>c" },
	{ { "n" }, "<C-W>h" },
	{ { "n" }, "<C-W>j" },
	{ { "n" }, "<C-W>k" },
	{ { "n" }, "<C-W>l" },
	{ { "n" }, "<C-W><C-h>" },
	{ { "n" }, "<C-W><C-j>" },
	{ { "n" }, "<C-W><C-k>" },
	{ { "n" }, "<C-W><C-l>" },
}

for i, mapping_to_disable in ipairs(disabled_mappings) do
	map(mapping_to_disable[1], mapping_to_disable[2], "<nop>")
end

function find_files(force_smart)
	local exclude_pattern = force_smart and {} or { "*.po", "*.pot" }
	Snacks.picker.files({ focus = "input", exclude = exclude_pattern })
end

-- files
map("n", "<C-p>", find_files, { desc = "Find Files" })
map("n", "<leader><leader>", find_files, { desc = "Find Files" })
map("n", "<leader>ff", function()
	find_files(true)
end, { desc = "Find Files" })

map("n", "<leader>fg", function()
	Snacks.picker.grep({ focus = "input", exclude = { "*.po", "*.pot" } })
end, { desc = "Grep" })

map("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Find Buffers" })

-- Git
map("n", "<leader>gd", function()
	Snacks.picker.git_diff({ cwd = get_git_root() })
end, { desc = "Git Diff" })

map("n", "<leader>gS", function()
	Snacks.picker.git_stash({ cwd = get_git_root() })
end, { desc = "Git Stash" })

map("n", "<leader>gl", function()
	Snacks.picker.git_log({ cwd = get_git_root() })
end, { desc = "Git Log" })

map("n", "<leader>gs", function()
	Snacks.picker.git_status({ cwd = get_git_root() })
end, { desc = "Git Status" })

map("n", "<leader>gB", function()
	Snacks.picker.git_branches({ cwd = get_git_root() })
end, { desc = "Git Branches" })

map("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Hunk Stage" })
map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Hunk Preview" })
map("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })

-- find misc
map("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Search Help" })

map("n", "<leader>si", function()
	Snacks.picker.icons()
end, { desc = "Search Icons" })

-- LSP
map("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Go To Definitions" })

map("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "Go To Declarations" })

map("n", "gr", function()
	Snacks.picker.lsp_references()
end, { desc = "References" })

map("n", "gI", function()
	Snacks.picker.lsp_implementations()
end, { desc = "Go To Implementations" })

map("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "Toggle Explorer" })

-- toggle
map("n", "<leader>gfb", function()
	require("gitsigns").blame()
end, { desc = "Blame File" })

map("n", "<leader>gb", function()
	require("gitsigns").blame_line({ full = true })
end, { desc = "Toggle Git Blame Line" })

map("n", "<leader>tf", "za", { desc = "Fold Line" })
map("n", "<leader>tof", "zR", { desc = "Unfold All" })
map("n", "<leader>tcf", "zM", { desc = "Fold All" })

--debugger
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd> DapContinue <cr>", { desc = "Start or Continue the debugger" })
map("n", "<leader>dc", "<cmd> DapContinue <cr>", { desc = "Debugger Continue" })
map("n", "<F6>", "<cmd> DapStepOver <cr>", { desc = "Debugger Step Over" })
map("n", "<leader>di", "<cmd> DapStepInto <cr>", { desc = "Debugger Step Into" })
map("n", "<F5>", "<cmd> DapStepInto <cr>", { desc = "Debugger Step Into" })
map("n", "<leader>do", "<cmd> DapStepOut <cr>", { desc = "Debugger Step Out" })
map("n", "<F7>", "<cmd> DapStepOut <cr>", { desc = "Debugger Step Out" })

-- line manipulations
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move Up", silent = true })
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move Down", silent = true })

map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })

map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })

map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- terminal
map("n", "<C-t>", function()
	Snacks.terminal()
end, { desc = "Terminal" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map({ "n" }, "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
map({ "v" }, "<leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- insert movements
map("i", "<C-Right>", "<C-o>e", { desc = "Next Word" })
map("i", "<C-Left>", "<C-o>b", { desc = "Prev Word" })

-- windows
map("n", "<leader>wh", "<cmd>wincmd s<CR>", { desc = "Split Window Below", silent = true })
map("n", "<leader>wv", "<cmd>wincmd v<CR>", { desc = "Split Window Right", silent = true })
map("n", "<leader>wd", "<cmd>wincmd c<cr>", { desc = "Delete Window", silent = true })
map("n", "<C-Left>", "<cmd>wincmd h<CR>", { desc = "Move focus to the left window" })
map("n", "<C-Right>", "<cmd>wincmd l<CR>", { desc = "Move focus to the right window" })
map("n", "<C-Down>", "<cmd>wincmd j<CR>", { desc = "Move focus to the lower window" })
map("n", "<C-Up>", "<cmd>wincmd k<CR>", { desc = "Move focus to the upper window" })

--buffers
map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Close buffer" })

-- Scratch
local filetypes = {
	{ text = "css", value = "css" },
	{ text = "go", value = "go" },
	{ text = "html", value = "html" },
	{ text = "javascript", value = "javascript" },
	{ text = "javascriptreact", value = "javascriptreact" },
	{ text = "lua", value = "lua" },
	{ text = "markdown", value = "markdown" },
	{ text = "python", value = "python" },
	{ text = "rust", value = "rust" },
	{ text = "typescript", value = "typescript" },
	{ text = "typescriptreact", value = "typescriptreact" },
	{ text = "zig", value = "zig" },
	{ text = "text", value = "text" },
}

map("n", "<leader>.", function()
	require("utils.snacks.scratch").new_scratch(filetypes)
end, { desc = "Toggle Scratch buffer" })

map("n", "<leader>fs", function()
	require("utils.snacks.scratch").select_scratch()
end, { desc = "Select Scratch buffers" })

-- nvim
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Close Nvim" })

-- dont move the cursor after a yanking
map("v", "y", "ygv<Esc>", { noremap = true, silent = true })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- i = insert mode
map("i", "<Esc>", function()
	local blink = require("blink.cmp")
	-- If popup is visible, close it and stay in insert mode
	if blink.is_menu_visible() then
		blink.hide()
	else
		-- Otherwise, normal escape behavior
		return "<Esc>"
	end
end, { expr = true, noremap = true })
