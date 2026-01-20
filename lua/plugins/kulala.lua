---------
-- Cool HTTP client in your Nvim
---------

return {
    'mistweaverco/kulala.nvim',
    ft = {'http', 'rest'},

    opts = {
        global_keymaps = true,
        kulala_keymaps_prefix = '',
        global_keymaps_prefix = '<leader>k',
    },

    keys = {
        { '<leader>ks', desc = 'Send request' },
        { '<leader>ka', desc = 'Send all requests' },
        { '<leader>kb', desc = 'Open scratchpad' },
    },
}
