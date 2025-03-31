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
        ensure_installed = { "ruff", "gopls", "ts_ls" },
        automatic_installation = true,
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' }, -- Ensure cmp-nvim-lsp is a dependency for better integration
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
            lineLength = 88,
            lint = {
              select = { "E", "F" },
            },
          },
        },
      })

      -- gopls setup for Go development
      lspconfig.gopls.setup({
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
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
          },
        },
      })

    lspconfig.ts_ls.setup({
      -- Optional: Customize your settings here
      on_attach = function(client, bufnr)
        -- Add your custom keymaps here if needed
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      end,
      capabilities = require('cmp_nvim_lsp').default_capabilities(), -- If using nvim-cmp
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
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
