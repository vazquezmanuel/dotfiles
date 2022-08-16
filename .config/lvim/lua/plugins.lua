lvim.plugins = {
  -- Default configuration: https://www.lunarvim.org/plugins/02-extra-plugins.html
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
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      local opts = {
        -- char = "▏",
        filetype_exclude = {
          "alpha",
          "help",
          "terminal",
          "dashboard",
          "lspinfo",
          "lsp-installer",
          "mason",
        },
        buftype_exclude = { "terminal" },
        bufname_exclude = { "config.lua" },

        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
        -- use_treesitter = false,
      }
      require("indent_blankline").setup(opts)
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  -- My own plugins
  { "max397574/better-escape.nvim" },
  -- Colorschemes
  { "catppuccin/nvim", as = "catppuccin" },
  { "projekt0n/github-nvim-theme" },
  { "ellisonleao/gruvbox.nvim" },
  { "shaunsingh/nord.nvim" },
  { "rose-pine/neovim" },
  { "EdenEast/nightfox.nvim" }
}
