return {
{
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" }, -- Load on buffer read or new file
    config = function()
      local lint = require("lint")

      -- Specify linters by filetype
      lint.linters_by_ft = {
        markdown = { "markdownlint" }, -- Use markdownlint for Markdown files
      }

      -- Set up an autocommand to run linting automatically
      vim.api.nvim_create_autocmd({ "InsertLeave", "BufReadPost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
}
}
