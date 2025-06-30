vim.opt.clipboard = 'unnamedplus' -- use system keyboard for yank
vim.opt.nu = true                 -- set line numbers -- set line numbers
vim.opt.number = true            -- Enables absolute line numbers on the current line
vim.opt.relativenumber = true     -- Enables relative line numbers
require("oil").setup({
delete_to_trash = true,
}
)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- set tab size to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.textwidth = 80 

vim.opt.wrap = false
 
vim.opt.incsearch = true -- incremental search
 
vim.opt.termguicolors = true

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<Up>', '<Nop>', { silent = true })
vim.keymap.set('n', '<Down>', '<Nop>', { silent = true })
vim.keymap.set('n', '<Left>', '<Nop>', { silent = true })
vim.keymap.set('n', '<Right>', '<Nop>', { silent = true })

--vim.keymap.set('i', '<Up>', '<Nop>', { silent = true })
--vim.keymap.set('i', '<Down>', '<Nop>', { silent = true })
--vim.keymap.set('i', '<Left>', '<Nop>', { silent = true })
--vim.keymap.set('i', '<Right>', '<Nop>', { silent = true })

vim.keymap.set('v', '<Up>', '<Nop>', { silent = true })
vim.keymap.set('v', '<Down>', '<Nop>', { silent = true })
vim.keymap.set('v', '<Left>', '<Nop>', { silent = true })
vim.keymap.set('v', '<Right>', '<Nop>', { silent = true })
vim.api.nvim_set_hl(0, "Visual", { bg = "#988049", fg = "#ffffff" })

-- My custom
vim.keymap.set('n', '<leader>=', 'i- [ ]<Esc>')
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Open Markdown Preview" })
vim.keymap.set("n", "<leader>t", ":enew | setlocal buftype=nofile bufhidden=hide noswapfile<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Git Diffview" })
vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", { desc = "Close Diffview" })

require("config.highlights")

vim.keymap.set("n", "d_", '"_d', { noremap = true, silent = true })
vim.keymap.set("v", "d_", '"_d', { noremap = true, silent = true })

require("config.auto_update")

if vim.fn.getenv("TERM_PROGRAM") == "ghostty" then
  vim.opt.title = true
  vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"

  vim.api.nvim_create_autocmd("User", {
    pattern = "OilEnter",
    callback = function()
      vim.cmd("redraw")  -- Force Neovim to re-evaluate &titlestring
    end,
  })
end

-- In your lua/config/keymaps.lua or similar:
vim.keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>", { desc = "Search diagnostics" })

vim.cmd [[
  highlight LineNr guifg=#888888
  highlight CursorLineNr guifg=#ffffff gui=bold
]]
