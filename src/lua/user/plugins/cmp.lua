local function setup()
  local cmp = require('cmp')

  local icons = require "user.icons"

  local kind_icons = icons.kind

  local compare = require('cmp.config.compare')

  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
  vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
  vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })
  vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })

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
        compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
        compare.offset,
        compare.order,
      },
    },

    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = kind_icons[vim_item.kind]

        if entry.source.name == "cmp_tabnine" then
          vim_item.kind = icons.misc.Robot
          vim_item.kind_hl_group = "CmpItemKindTabnine"
        end
        if entry.source.name == "copilot" then
          vim_item.kind = icons.git.Octoface
          vim_item.kind_hl_group = "CmpItemKindCopilot"
        end

        if entry.source.name == "emoji" then
          vim_item.kind = icons.misc.Smiley
          vim_item.kind_hl_group = "CmpItemKindEmoji"
        end

        if entry.source.name == "crates" then
          vim_item.kind = icons.misc.Package
          vim_item.kind_hl_group = "CmpItemKindCrate"
        end

        if entry.source.name == "lab.quick_data" then
          vim_item.kind = icons.misc.CircuitBoard
          vim_item.kind_hl_group = "CmpItemKindConstant"
        end

        -- NOTE: order matters
        vim_item.menu = ({
          nvim_lsp = "",
          nvim_lua = "",
          luasnip = "",
          buffer = "",
          path = "",
          emoji = "",
        })[entry.source.name]
        return vim_item
      end,
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
  commit = "d97d85e01339f01b842e6ec1502f639b080cb0fc",

  config = setup,

  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp',                commit = 'cbc7b02bb99fae35cb42f514762b89b5126651ef' },
    { 'hrsh7th/cmp-buffer',                  commit = 'b74fab3656eea9de20a9b8116afa3cfc4ec09657' },
    { 'hrsh7th/cmp-path',                    commit = 'c642487086dbd9a93160e1679a1327be111cbc25' },
    { 'hrsh7th/cmp-cmdline',                 commit = 'd126061b624e0af6c3a556428712dd4d4194ec6d' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help', commit = 'fd3e882e56956675c620898bf1ffcf4fcbe7ec84' },
    { 'L3MON4D3/LuaSnip',                    version = '2.4.1' },
    { 'saadparwaiz1/cmp_luasnip',            commit = '98d9cb5c2c38532bd9bdb481067b20fea8f32e90' },
  }
}
