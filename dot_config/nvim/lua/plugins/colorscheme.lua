return {
  { "Mofiqul/vscode.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        integrations = {
          lsp_saga = true,
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          hop = true,
          fidget = true,
          treesitter = true,
          mason = true,
          illuminate = true,
          lsp_trouble = true,
          notify = true,
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
