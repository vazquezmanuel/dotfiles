-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "json",
  "lua",
  "python",
  "rust",
  "latex",
  "bibtex",
}

--lvim.builtin.treesitter.ignore_install = { "haskell" }

-- generic LSP settings
lvim.lsp.installer.setup.ensure_installed = {
  "bashls",
  "clangd",
  "jsonls",
  "sumeko_lua",
  "pyright",
  "rust_analyzer",
  "texlab",
  "vimls",
}
