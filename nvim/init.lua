-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- Plugins
require("lazy").setup({
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
})

-- Apply Theme with a pure black background override
require("tokyonight").setup({
  style = "night",
  transparent = false,
  on_colors = function(colors)
    colors.bg = "#000000" -- Forces pitch black editor background
  end
})

vim.cmd[[colorscheme tokyonight-night]]

-- Force the UI elements back to white/black to match your rice
vim.cmd([[
  highlight LineNr guifg=#444444
  highlight CursorLineNr guifg=#ffffff
  highlight StatusLine guibg=#ffffff guifg=#000000
]])
