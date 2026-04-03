vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	callback = function()
		vim.wo.scrolloff = 0
		local config = vim.api.nvim_win_get_config(0)
		if config.relative == "" then
			vim.api.nvim_buf_set_keymap(
				0,
				"t",
				"<Esc>",
				[[<C-\><C-n>]],
				{ noremap = true, silent = true, desc = "quit insert mode inside terminal" }
			)
		end
	end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks_picker_list",
  callback = function()
    vim.wo.winbar = ""
    vim.wo.statusline = " "
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local value = ev.data.params
		.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
		if not client or type(value) ~= "table" then
			return
		end
		local p = progress[client.id]

		for i = 1, #p + 1 do
			if i == #p + 1 or p[i].token == ev.data.params.token then
				p[i] = {
					token = ev.data.params.token,
					msg = ("[%3d%%] %s%s"):format(
						value.kind == "end" and 100 or value.percentage or 100,
						value.title or "",
						value.message and (" **%s**"):format(value.message) or ""
					),
					done = value.kind == "end",
				}
				break
			end
		end
		local msg = {} ---@type string[]
		progress[client.id] = vim.tbl_filter(function(v)
			return table.insert(msg, v.msg) or not v.done
		end, p)

		local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		-- local spinner = { "◜", "◝", "◞", "◟" }

		vim.notify(table.concat(msg, "\n"), vim.log.levels.INFO, {
			id = "lsp_progress",
			title = client.name,
			opts = function(notif)
				notif.icon = #progress[client.id] == 0 and " "
					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 150)) % #spinner + 1]
			end,
		})
	end,
})

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
