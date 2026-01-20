---------
-- Plugin that allows showing the only buffer at the center of screen
---------

return {
    'shortcuts/no-neck-pain.nvim',
    version = '*',

    opts = {
        width = 120,
    },

    keys = {
        -- For EN keyboard layout
        { '<leader>wc', '<CMD>NoNeckPain<CR>', desc = 'Toggle center buffer' },

        -- For RU keyboard layout
        { '<leader>цс', '<CMD>NoNeckPain<CR>', desc = 'Toggle center buffer' },
    }
}
