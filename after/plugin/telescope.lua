local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>?',  builtin.oldfiles, { desc = '[?] Find recently opened files' })

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sg', builtin.git_files, {desc = '[S]earch [F]it' })
vim.keymap.set('n', '<leader>sl', builtin.live_grep, { desc = '[S]earch by [L]ive' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<leader>sp', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {desc = '[S]earch [P]roject'})

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
