require("mason").setup()

local mr = require("mason-registry")

local servers = {
	"lua-language-server",
	"glsl_analyzer",
	"html-lsp",
	"css-lsp",
	"tailwindcss-language-server",
	"rust-analyzer",
	"cpptools",
	"clangd",
}

for _, name in ipairs(servers) do
	local p = mr.get_package(name)
	if not p:is_installed() then
		p:install()
	end
end

require("mason-lspconfig").setup()

require("lsp.clangd")
require("lsp.odoo_ls")
