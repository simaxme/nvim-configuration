local cmp = require('cmp')


local compare = require('cmp.config.compare')


cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "copilot" }
    }),

    mapping = cmp.mapping.preset.insert({
        ['<C-Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
        ['<C-Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    }),
    -- completion = {
    --     completeopt = 'menu,menuone,noinsert'
    -- },
    view = {
        entries = {name = 'custom', selection_order = 'near_cursor'}
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
