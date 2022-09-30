require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "typescript",
        "java",
        "bash",
        "html",
        "lua",
        "vim",
        "python",
        "css",
        "scss",
        "json",
        "tsx"
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
    }
}
