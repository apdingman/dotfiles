vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Delay to avoid interfering with startup performance
    vim.defer_fn(function()
      require("lazy").update({ show = false })
    end, 2000)  -- delay in ms
  end,
})
