return {
    {
        url = 'https://codeberg.org/andyg/leap.nvim',

        -- To avoid issue with not working hotkey on RU keyboard layout it should not be lazy
        lazy = false,
        -- But it should be loaded after langmapper.nvim (which has 1st priority)
        priority = 10,

        opts = {
            -- Define equivalents for brackets and quotes, in addition to the default whitespace group
            equivalence_classes = {
                ' \t\r\n',
                '([{',
                ')]}',
                '\'"`',
            },

            -- Exclude whitespace and the middle of alphabetic words from preview
            preview = function (ch0, ch1, ch2)
                return not (
                    ch1:match('%s')
                    or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
                )
            end
        },

        config = function ()
            -- A fix for leap marks on RU keyboard layout
            -- @see: https://github.com/Wansmer/langmapper.nvim/discussions/11#discussion-5102704
            require("leap.input")["get_char"] = function()
                local ok, ch = pcall(vim.fn.getcharstr)
                if ok and ch ~= vim.api.nvim_replace_termcodes("<esc>", true, false, true) then
                    return require("langmapper.utils").translate_keycode(ch, "default", "ru")
                end
            end

            require('leap.user').set_repeat_keys('<enter>', '<backspace>')
        end,

        keys = {
            -- For EN keyboard layout
            { 's', mode = { 'n', 'x', 'o' }, '<Plug>(leap)', desc = 'Jump to character' },

            -- For RU keyboard layout
            { 'ы', mode = { 'n', 'x', 'o' }, '<Plug>(leap)', desc = 'Jump to character' },
        }
    }
}
