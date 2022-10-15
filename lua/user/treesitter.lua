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
        "javascript"
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
    }
}

-- require('treesitter-context').setup {
--    mode = "topline",
--    separator = "-",
--    patterns = {
--        default = {
--            'class',
--            'function',
--            'method'
--        }
--    }
-- }
