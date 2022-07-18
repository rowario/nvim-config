local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	path = "[Path]"
}

lspkind = require('lspkind')

lspkind.init()

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<CR>"] = {i = cmp.mapping.confirm({ select = true })},
		["<A-j>"] = {i = cmp.mapping.select_next_item()},
		["<A-k>"] = {i = cmp.mapping.select_prev_item()},
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	},
	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = source_mapping
		}
	}
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
			Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
			Nnoremap("<leader>d", ":lua vim.diagnostic.open_float()<CR>")
			Nnoremap("<A-CR>", ":lua vim.lsp.buf.code_action()<CR>")
			Nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
			Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
		end,
	}, _config or {})
end

require('lspconfig').phpactor.setup(config({
	cmd = { "phpactor", "language-server" },
	filetypes = { "php" }
}))

require("lspconfig").tsserver.setup(config({
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
}))

require("lspconfig").rust_analyzer.setup(config({
	flags = {
		debounce_text_changes = 150
	},
	cmd = { "rustup", "run", "stable", "rust-analyzer" },
	filetypes = { "rust" }
}))

require("lspconfig").omnisharp.setup(config({
	cmd = { "/usr/bin/omnisharp", "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) },
	filetypes = { "cs", "vb" }
}))

require("lspconfig").clangd.setup(config({
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}))
