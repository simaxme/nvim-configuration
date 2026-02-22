return {
  "zbirenbaum/copilot.lua",

  commit = "5c01badd42049a63ac9e5d6c8ea85aaf66cb940f",
  cmd = "Copilot",
  event = "InsertEnter",

  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-e>"
        }
      }
    })
  end
}
