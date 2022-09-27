local cmp = require('cmp')


local compare = require('cmp.config.compare')

-- keymaps
vim.api.nvim_set_keymap("n", "<C-s>", ":lua vim.lsp.buf.definition()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-c>", ":Telescope lsp_references<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>r", ":lua vim.lsp.buf.rename()<CR>", {noremap = true})

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },

    sources = cmp.config.sources({
        {name = "nvim_lsp"},
        {name = "nvim_lsp_signature_help"}
    }),

    mapping = cmp.mapping.preset.insert({
      ['<C-Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
      ['<C-Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    }),
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },

    window = {
        documentation = false,
        completion = {
          border = "rounded",
        },
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
