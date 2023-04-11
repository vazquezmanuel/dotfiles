-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- plugins
lvim.plugins = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true,    -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  { "max397574/better-escape.nvim" },
  { "lervag/vimtex" },
  -- colorschemes
  { "catppuccin/nvim",             as = "catppuccin" },
  { "projekt0n/github-nvim-theme" },
  { "ellisonleao/gruvbox.nvim" },
  { "shaunsingh/nord.nvim" },
  { "rose-pine/neovim" },
  { "EdenEast/nightfox.nvim" }
}

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}
require("better_escape").setup {
  mapping = { "jk" }, -- a table with mappings to use
}

-- languages
-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
}
-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
}
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "rust",
  "latex",
  "bibtex",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
--lvim.builtin.treesitter.ignore_install = { "haskell" }
-- generic LSP settings
lvim.lsp.installer.setup.ensure_installed = {
  "bashls",
  "clangd",
  "sumneko_lua",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "texlab",
  "vimls",
}

-- colorscheme
-- Catppuccin
vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup()
-- lvim.colorscheme = "catppuccin"

-- Github
-- lvim.colorscheme = "github_dark_default"

-- Nord
-- lvim.colorscheme = "nord"

-- Nightfox
-- lvim.colorscheme = "carbonfox"

-- Rose-pine
-- lvim.colorscheme = "rose-pine"

-- Default lvim
lvim.colorscheme = "lunar"

-- LaTeX
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'sioyek'
vim.cmd([[
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'Build',
            \}
]])
vim.g.vimtex_quickfix_mode = 0
vim.opt.conceallevel = 1
vim.g.tex_conceal = 'abdmg'
