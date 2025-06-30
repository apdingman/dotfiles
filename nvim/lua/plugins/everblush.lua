return {
  {
    "Everblush/nvim",
    name = "everblush",
    priority = 1000, -- Ensure it loads early
    config = function()
      vim.cmd("colorscheme everblush")
    end,
  },
}
