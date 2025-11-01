require("ibl").setup {
    scope = {
        show_start = false
    },


    exclude = {
        filetypes = {
            "terminal",
            "nofile",
            "quickfix",
            "prompt",
            "dashboard",
            "lspinfo",
            "checkhealth",
            "help",
            "man",
            "gitcommit",
            "TelescopePrompt",
            "TelescopeResults"
        }
    }

}
