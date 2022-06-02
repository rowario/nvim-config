local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
}

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
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
	},
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

require("lspconfig").tsserver.setup(config())

require("lspconfig").rust_analyzer.setup(config({
	flags = {
		debounce_text_changes = 150
	},
	cmd = { "rustup", "run", "stable", "rust-analyzer" },
}))

