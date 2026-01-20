return {
    {
        'ggandor/leap.nvim',

        opts = {
            -- Define equivalents for brackets and quotes, in addition to the default whitespace group
            equivalence_classes = {
                ' \t\r\n',
                '([{',
                ')]}',
                '\'"`',
            },

            -- Exclude whitespace and the middle of alphabetic words from preview
            preview_filter = function (ch0, ch1, ch2)
                return not (
                    ch1:match('%s') or
                    ch0:match('%a') and ch1:match('%a') and ch2:match('%a')
                )
            end
        },

        config = function () end,

        keys = {
            -- For EN keyboard layout
            { 's', mode = { 'n', 'x', 'o' }, '<plug>(leap)', desc = 'Jump to character' },

            -- For RU keyboard layout
            { 'ы', mode = { 'n', 'x', 'o' }, '<plug>(leap)', desc = 'Jump to character' },
        }
    }
}
