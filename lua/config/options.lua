vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '⏑', lead = '·' }

vim.o.number = true
vim.opt.termguicolors = true

vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.cursorline = true
vim.o.updatetime = 250

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.confirm = true

vim.o.fixendofline = true
vim.o.endofline = true

-- Add new line to the end of the file
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  group = vim.api.nvim_create_augroup('UserOnSave', {}),
  pattern = '*',
  callback = function()
    local n_lines = vim.api.nvim_buf_line_count(0)
    local last_nonblank = vim.fn.prevnonblank(n_lines)
    if last_nonblank <= n_lines then vim.api.nvim_buf_set_lines(0,
      last_nonblank, n_lines, true, { '' })
    end
  end,
})

