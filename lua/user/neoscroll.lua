require('neoscroll').setup({
    mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
        '<C-y>', 'zt', 'zz', 'zb' },
})

local neoscroll = require('neoscroll');

-- for scrolling
vim.keymap.set("", "<S-Up>", function () neoscroll.scroll(-50, true, .5) end, {noremap = true})
vim.keymap.set("", "<S-Down>", function () neoscroll.scroll(50, true, .5) end, {noremap = true})
