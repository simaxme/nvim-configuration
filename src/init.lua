require('user.config')
require('user.plugins')
require('user.statusbar')
require('user.syntax')
require('user.title')
require('user.events')
require('user.hotkeys')
-- require('user.toggleterm')
require('user.git')


-- plugins
require('user.lsp.mason')
require('user.lsp.init')
require('user.lsp.cmp')
require('user.treesitter')
require('user.telescope.init')
require('user.gitsigns')
require('user.tmux')
require("user.guessindent")
-- require("user.tmux-autorun")

require("user.mediafiles")

-- require("simaxme-java").setup({
--  rename = {
--    enable = true,
--    nvimtree = true,
--    write_and_close = false,
--    telescope = true
--  },
--  snippets = {
--    enable = true
--  }
-- })
