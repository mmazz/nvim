function ColorMyPencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#b0b7c0' })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#647c90' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#b0b7c0' })
end

-- color
return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark",
                },
            })
            ColorMyPencils("tokyonight")
        end
    },
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                flavour = "frappe",
            })
 --           ColorMyPencils()
        end
    },
}

