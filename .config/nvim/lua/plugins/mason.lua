return {
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ruff" }
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')

      -- Ruff native language server setup
      lspconfig.ruff.setup({
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }

          -- Key mappings for LSP functionality
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        end,
        settings = {
          ruff = {
            -- Optional settings for Ruff
            lineLength = 88,
            lint = {
              select = { "E", "F" },
            },
          },
        },
      })
    end,
  },
  {
    'hrsh7th/nvim-cmp',            -- Completion plugin
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',      -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',        -- Buffer completions
      'hrsh7th/cmp-path',          -- Path completions
      'hrsh7th/cmp-cmdline',       -- Command line completions
      'hrsh7th/cmp-nvim-lua',      -- Lua completions
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup {
        mapping = {
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        },
      }
    end,
  }
}
