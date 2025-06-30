return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'sharkdp/fd',
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      defaults = {
        file_ignore_patterns = { ".git/" },
      },
    })
    require('telescope').load_extension('fzf')
  end,
}
