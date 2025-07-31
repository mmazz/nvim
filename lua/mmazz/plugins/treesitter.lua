return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c", "cpp", "lua", "python", "bash", "html", "json", "yaml",
        "vim", "vimdoc", "gitignore", "bibtex"
      },
      sync_install = false,
      auto_install = true,
      ignore_install = { "latex" }, -- opcional, podés sacarlo si querés usar LaTeX
      highlight = {
        enable = true,
        disable = { "css", "latex", "markdown" }, -- opcional
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true, -- activalo si querés autocierre de etiquetas en HTML
      },
    })
  end
}
