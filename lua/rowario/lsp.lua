local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	path = "[Path]",
}


cmp.setup({
	mapping = {
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	},
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
			Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
			Nnoremap("<leader>d", ":lua vim.diagnostic.open_float()<CR>")
			Nnoremap("<leader>vca", ":lua vim.lsp.buf.code_action()<CR>")
			Nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
			Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
		end,
	}, _config or {})
end

require("lspconfig").tsserver.setup(config())

require("lspconfig").rust_analyzer.setup(config({
	flags = {
		debounce_text_changes = 150
	},
	cmd = { "rustup", "run", "stable", "rust-analyzer" },
}))

require'lsp_extensions'.inlay_hints{}
