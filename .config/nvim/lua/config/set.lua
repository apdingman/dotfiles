vim.opt.clipboard = 'unnamedplus' -- use system keyboard for yank
vim.opt.nu = true                 -- set line numbers -- set line numbers
vim.opt.number = true            -- Enables absolute line numbers on the current line
vim.opt.relativenumber = true     -- Enables relative line numbers
vim.cmd("colorscheme nightfox")

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

vim.keymap.set('n', '<leader>=', ':Neotree toggle<CR>', { silent = true })
vim.keymap.set('v', '<leader>=', ':Neotree toggle<CR>', { silent = true })

vim.keymap.set('n', '<leader>e', ':Neotree reveal<CR>', { silent = true })
vim.keymap.set('v', '<leader>e', ':Neotree reveal<CR>', { silent = true })

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Check if no files are opened on startup
        if vim.fn.argc() == 0 then
            vim.cmd("Neotree show")
        end
    end,
})
