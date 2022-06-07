require('telescope').setup {
	defaults = {
		initial_mode = 'normal',
		file_ignore_patterns = {
			".git",
			"node_modules",
			".idea",
			"target",
			"autoload",
			"dist"
		}
	}
}
