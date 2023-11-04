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
        "tsx",
        "javascript",
        "nix",
        "kotlin" -- for kotlin scripts
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
    },

    autotag = {
        enable = true
    }
}
