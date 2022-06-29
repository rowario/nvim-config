require'nvim-treesitter.configs'.setup {
	ensure_installed = { "typescript", "lua", "rust", "php", "c_sharp", "fish" },
	sync_install = true,
	highlight = {
		enable = true,
		use_languagetree = true
	}
}
