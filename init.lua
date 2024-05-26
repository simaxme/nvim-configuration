require('user.config')
require('user.plugins')
require('user.statusbar')
require('user.syntax')
require('user.title')
require('user.events')
require('user.hotkeys')
require('user.toggleterm')

require('user.git')

-- plugins
require('user.lsp.mason')
require('user.lsp.init')
require('user.lsp.cmp')
require('user.nvimtree')
require('user.treesitter')
require('user.telescope.init')
require('user.gitsigns')
require('user.autopairs')
require('user.symbols')
require('user.illuminate')
require('user.tmux')
require("user.mediafiles")
require("user.guessindent")
require("user.indent-blackline")
require("user.treesj")
require("user.lsp.luasnip")

require("user.grep")

require("simaxme-java").setup({
    rename = {
        enable = true,
        nvimtree = true,
        write_and_close = false
    },
    snippets = {
        enable = true
    }
})
