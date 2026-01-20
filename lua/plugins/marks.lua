---------
-- Plugin for improving UX when dealing with marks
---------

return {
    'chentoast/marks.nvim',
    event = 'VeryLazy',

    opts = {
        default_mappings = false,
    },

    keys = {
        {'<leader>mb', '<Plug>(Marks-deletebuf)', desc = 'Delete marks in buffer'},
        {'<leader>mc', '<Plug>(Marks-deleteline)', desc = 'Delete current mark'},
        {'[m', '<Plug>(Marks-prev)', desc = 'Go to prev mark'},
        {']m', '<Plug>(Marks-next)', desc = 'Go to next mark'},
    }
}
