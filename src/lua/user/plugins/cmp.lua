local function setup()
  local cmp = require('cmp')

  local compare = require('cmp.config.compare')

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require 'luasnip'.lsp_expand(args.body)
      end,
    },

    sources = cmp.config.sources({
      { name = 'luasnip' },
      { name = "nvim_lsp" },
      { name = "nvim_lsp_signature_help" },
      { name = "copilot" }
    }),

    mapping = cmp.mapping.preset.insert({
      ['<C-Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
      ['<C-Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    view = {
      entries = { name = 'custom', selection_order = 'near_cursor' }
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

  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )
end

return {
  'hrsh7th/nvim-cmp',

  config = setup,

  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',
  }
}
