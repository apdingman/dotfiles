return {
{
    "Mofiqul/dracula.nvim",
    config = function()
      require("dracula").setup({
        transparent_bg = true, -- Adjust as needed
      })
      vim.cmd("colorscheme dracula")
    end,
  },
}
