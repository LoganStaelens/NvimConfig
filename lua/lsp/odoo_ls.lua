local odoo_ls_locations = {
	vim.fn.expand("$HOME/.local/share/nvim/odoo/odoo_ls_server"),
	"odoo_ls_server",
}

local executable = ""

for _, location in ipairs(odoo_ls_locations) do
	if vim.fn.executable(location) == 1 then
		executable = location
	end
end 

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("odoo_ls", {
	cmd = {
		executable,
	},
	filetypes = { "python", "xml" },
	workspace_folders = { {
		uri = vim.uri_from_fname(vim.fn.getcwd()),
		name = "main_folder",
	} },
    capabilities = capabilities,
	settings = {
		Odoo = {
			selectedProfile = "main",
		},
	},
})
vim.lsp.enable("odoo_ls")
