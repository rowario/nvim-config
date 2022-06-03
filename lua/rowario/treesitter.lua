require'nvim-treesitter.configs'.setup {
	ensure_installed = { "typescript", "lua", "rust" },

	sync_install = true,

	highlight = {
		enable = true,
	},
}
