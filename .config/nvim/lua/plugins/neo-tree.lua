return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup({
        enable_git_status = false,
        filesystem = {
          filtered_items = {
            visible = true, -- Set this to `false` if you want hidden files hidden by default
            hide_dotfiles = false, -- Set to true to hide dotfiles (e.g., `.gitignore`)
            hide_by_name = { -- List of specific file names to hide
              -- You can add any file you want hidden by default here, e.g., "Dockerfile"
              -- If Dockerfile is showing as hidden and you don't want that, remove it from this list
            },
          },
        },
      })
    end
  }
}
