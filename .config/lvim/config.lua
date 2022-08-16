require('plugins')
require('keymaps')
require('languages')
require('colorscheme')

-- General
lvim.log.level = "warn"
lvim.format_on_save = true
vim.opt.cmdheight = 1 -- space in the neovim command line
vim.opt.shell = "/bin/sh"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.notify.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.treesitter.highlight.enabled = true
