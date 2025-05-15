vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "⏑", lead = "·" }

vim.o.number = true
vim.opt.termguicolors = true

vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.cursorline = true
vim.o.updatetime = 250

vim.o.undofile = true
vim.o.mousescroll = "ver:6,hor:3"

vim.o.ignorecase = true
vim.o.smartcase = true

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
