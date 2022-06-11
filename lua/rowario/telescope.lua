require('telescope').setup {
	defaults = {
		initial_mode = 'normal',
		file_ignore_patterns = {
			"bin",
			"obj",
			".git",
			"node_modules",
			".idea",
			"target",
			"autoload",
			"dist"
		}
	}
}
