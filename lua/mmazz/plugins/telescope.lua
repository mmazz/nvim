return {
    "nvim-telescope/telescope.nvim", tag = '0.1.5',

	dependencies = {
        "nvim-telescope/telescope-ui-select.nvim",
		"nvim-lua/plenary.nvim"
	},

    config = function()
		require('telescope').setup({
            extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {}
                }
            }
            })
        require("telescope").load_extension("ui-select")
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
		vim.keymap.set('n', '<leader>fs', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set('n', '<leader>ht', builtin.help_tags, {})
	end
}
