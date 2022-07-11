lua << END
require('lualine').setup()

require('onedark').setup {
    style = 'deep'
}
require('onedark').load()

require('nvim-treesitter.configs').setup {
    ensure_installed = { 
        "typescript", 
        "java",
        "bash",
        "html",
        "lua",
        "python",
        "css",
        "scss",
        "json"
    },

    highlight = { 
        enable = true,
        additional_vim_regex_highlighting = true
    }
}

require('telescope').load_extension('session-lens')
require('auto-session').setup {
    auto_save_enabled = false,
    auto_restore_enabled = false
}
require('session-lens').setup {
    path_display={'shorten'},
}
END
