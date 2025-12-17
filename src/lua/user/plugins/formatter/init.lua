return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      css = {
        "prettier",
        stop_after_first = true
      },

      scss = {
        "prettier",
        stop_after_first = true
      },

      htmlangular = {
        "prettier",
        stop_after_first = true
      },

      html = {
        "prettier",
        stop_after_first = true
      },

      typescript = {
        "prettier",
        stop_after_first = true
      },
      javascript = {
        "prettier",
        stop_after_first = true
      }
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 2000
    }
  }
}
