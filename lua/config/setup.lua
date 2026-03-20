vim.cmd("colorscheme catppuccin-mocha")
vim.opt.clipboard:append("unnamedplus")

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "⏑", lead = "·" }

vim.opt.virtualedit = "block"

vim.o.number = true
vim.opt.termguicolors = true

vim.o.wrap = true
vim.opt.breakindent = true

vim.o.scrolloff = 10
vim.o.cursorline = true
vim.o.updatetime = 250

vim.o.undofile = true
vim.o.swapfile = false

vim.o.mousescroll = "ver:3,hor:3"
-- vim.lsp.document_color.enable(true, {}, {style = 'virtual'})

vim.o.ignorecase = true
-- vim.o.smartcase = true

vim.o.confirm = true
vim.o.showmode = false
vim.o.laststatus = 3

vim.lsp.set_log_level(vim.log.levels.DEBUG)
vim.lsp.log.set_format_func(vim.inspect)
vim.diagnostic.config({
	virtual_text = {
		enabled = true,
		spacing = 2,
		prefix = "",
		suffix = "",
		format = function(diagnostic)
			if diagnostic.severity == vim.diagnostic.severity.ERROR then
				return string.format("󰅙 %s", diagnostic.message)
			end
			if diagnostic.severity == vim.diagnostic.severity.WARN then
				return string.format(" %s", diagnostic.message)
			end
			if diagnostic.severity == vim.diagnostic.severity.INFO then
				return string.format("󰋼 %s", diagnostic.message)
			end
			if diagnostic.severity == vim.diagnostic.severity.HINT then
				return string.format("󰌵 %s", diagnostic.message)
			end
		end,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅙",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "󰋼",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
})

-- Folding
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldmethod = "expr"
vim.o.foldlevel = 99
vim.opt.fillchars = {
	fold = " ",
	foldopen = "▼",
	foldsep = "│",
	foldclose = "▶",
}
vim.opt.foldopen:remove("hor")
vim.opt.foldtext = "v:lua.custom_foldtext()"

local function fold_virt_text(result, s, lnum, coloff)
	if not coloff then
		coloff = 0
	end
	local text = ""
	local hl
	for i = 1, #s do
		local char = s:sub(i, i)
		local hls = vim.treesitter.get_captures_at_pos(0, lnum, coloff + i - 1)
		local _hl = hls[#hls]
		if _hl then
			local new_hl = "@" .. _hl.capture
			if new_hl ~= hl then
				table.insert(result, { text, hl })
				text = ""
				hl = nil
			end
			text = text .. char
			hl = new_hl
		else
			text = text .. char
		end
	end
	table.insert(result, { text, hl })
end

function _G.custom_foldtext()
	local start = vim.fn.getline(vim.v.foldstart)
	local end_str = vim.fn.getline(vim.v.foldend)
	local end_ = vim.trim(end_str)
	local line_count = vim.v.foldend - vim.v.foldstart + 1
	local result = {}
	fold_virt_text(result, start, vim.v.foldstart - 1)
	table.insert(result, { "  󰇘  ", "Visual" })
	fold_virt_text(result, end_, vim.v.foldend - 1, #(end_str:match("^(%s+)") or ""))
	table.insert(result, { string.format(" 󰁂 %d", line_count) })
	return result
end

-- Debugger
vim.cmd("hi DapBreakpointColor guifg=#fa4848")
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointColor", linehl = "", numhl = "" })
