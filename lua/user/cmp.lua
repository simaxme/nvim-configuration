local cmp = require('cmp')

local icons = require "user.icons"

local kind_icons = icons.kind

local compare = require('cmp.config.compare')

-- keymaps
vim.api.nvim_set_keymap("n", "<C-s>", ":lua vim.lsp.buf.definition()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-c>", ":Telescope lsp_references<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>r", ":lua vim.lsp.buf.rename()<CR>", {noremap = true})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })
vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
