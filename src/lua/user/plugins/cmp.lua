local function setup()
  local cmp = require("cmp")

  local compare = require('cmp.config.compare')

  cmp.setup({
    snippet = {
      expand = function(args)
        require "luasnip".lsp_expand(args.body)
      end,
    },

    sources = cmp.config.sources({
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "nvim_lsp_signature_help" },
      { name = "copilot" }
    }),

    mapping = cmp.mapping.preset.insert({
      ["<C-Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
      ["<C-Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    }),
    view = {
      entries = { name = "custom", selection_order = "near_cursor" }
    },

    window = {
      documentation = {
        border = "rounded"
      },
      completion = {
        border = "rounded",
      }
    },

    sorting = {
      priority_weight = 2,
      comparators = {
        compare.locality,
        compare.recently_used,
        compare.score,
        compare.offset,
        compare.order,
      },
    },

    formatting = {
      fields = { "kind", "abbr", "menu" },
    },
  })

  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done()
  )
end

return {
  "hrsh7th/nvim-cmp",
  commit = "d97d85e01339f01b842e6ec1502f639b080cb0fc",

  config = setup,

  dependencies = {
    { "hrsh7th/cmp-nvim-lsp",                commit = "cbc7b02bb99fae35cb42f514762b89b5126651ef" },
    { "hrsh7th/cmp-buffer",                  commit = "b74fab3656eea9de20a9b8116afa3cfc4ec09657" },
    { "hrsh7th/cmp-path",                    commit = "c642487086dbd9a93160e1679a1327be111cbc25" },
    { "hrsh7th/cmp-cmdline",                 commit = "d126061b624e0af6c3a556428712dd4d4194ec6d" },
    { "hrsh7th/cmp-nvim-lsp-signature-help", commit = "fd3e882e56956675c620898bf1ffcf4fcbe7ec84" },
    { "L3MON4D3/LuaSnip",                    version = "2.4.1" },
    { "saadparwaiz1/cmp_luasnip",            commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" },
  }
}
