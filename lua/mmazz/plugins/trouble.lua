return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
	config = function()
		local builtin = require('trouble')

        builtin.setup({})
        vim.keymap.set("n", "<leader>tt", function()
            builtin.toggle()
        end)
--
--        vim.keymap.set("n", "[d", function()
--            builtin.next({ skip_groups = true, jump = true })
--        end)
--
--        vim.keymap.set("n", "]d", function()
--            builtin.previous({ skip_groups = true, jump = true })
--        end)
    end,
}
