return {
	"nvim-telescope/telescope.nvim", tag = '0.1.5',

	dependencies = { 
		"plenary"
	},

	config = function()
		require('telescope').setup({})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
		vim.keymap.set('n', '<leader>gs', function()
			builtin.grep_strings({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set('n', '<leader>ht', builtin.help_tags, {})
	end
}