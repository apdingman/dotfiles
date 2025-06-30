return {
  "lukas-reineke/headlines.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "markdown", "norg", "org" },
  config = function()
    require("headlines").setup({
      markdown = {
        fat_headlines = false,
        headline_highlights = {
          "Headline1",
          "Headline2",
          "Headline3",
          "Headline4",
          "Headline5",
          "Headline6",
        },
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        quote_highlight = "Quote",
      },
    })
  end,
}
