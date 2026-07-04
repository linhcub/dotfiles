-- Bootstrap lazy.nvim (automatically download the plugin manager if missing)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Set map leader key to Space
vim.g.mapleader = " "

-- Initialize lazy.nvim and configure plugins
require("lazy").setup({
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false, -- Load immediately on startup
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Required for file and folder icons
    },
    config = function()
      -- Configure nvim-tree options
      require("nvim-tree").setup({
        view = {
          width = 30,    -- Set sidebar width
          side = "left", -- Position sidebar on the left side
        },
      })

      -- Keymapping: Press Ctrl + n to toggle sidebar
      vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
    end,
  },
})

