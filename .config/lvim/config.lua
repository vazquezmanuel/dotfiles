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
lvim.builtin.alpha.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.bufferline.options.indicator_icon = nil
lvim.builtin.bufferline.options.indicator = { style = "icon", icon = "▎" }

-- LaTeX
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'sioyek'
vim.cmd([[
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}
]])
vim.g.vimtex_quickfix_mode = 0
vim.opt.conceallevel = 1
vim.g.tex_conceal = 'abdmg'
