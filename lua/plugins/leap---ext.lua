return {
    {
        url = "https://codeberg.org/andyg/leap.nvim",

        -- To avoid issue with not working hotkey on RU keyboard layout it should not be lazy
        lazy = false,
        -- But it should be loaded after langmapper.nvim (which has 1st priority)
        priority = 10,

        opts = {
            -- Define equivalents for brackets and quotes, in addition to the default whitespace group
            equivalence_classes = {
                " \t\r\n",
                "([{",
                ")]}",
                "'\"`",
            },

            -- Exclude whitespace and the middle of alphabetic words from preview
            preview = function(ch0, ch1, ch2)
                return not (ch1:match("%s") or (ch0:match("%a") and ch1:match("%a") and ch2:match("%a")))
            end,
        },

        config = function()
            -- A fix for leap marks on RU keyboard layout
            -- @see: https://github.com/Wansmer/langmapper.nvim/discussions/11#discussion-5102704
            require("leap.input")["get_char"] = function()
                local ok, ch = pcall(vim.fn.getcharstr)
                if ok and ch ~= vim.api.nvim_replace_termcodes("<esc>", true, false, true) then
                    return require("langmapper.utils").translate_keycode(ch, "default", "ru")
                end
            end

            require("leap.user").set_repeat_keys("<enter>", "<backspace>")

            ---
            -- Improvement for f/t/F/T motions
            ---
            local function ft(key_specific_args)
                require("leap").leap(vim.tbl_deep_extend("keep", key_specific_args, {
                    inputlen = 1,
                    inclusive = true,
                    opts = {
                        -- Force autojump.
                        labels = "",
                        -- Match the modes where you don't need labels (`:h mode()`).
                        safe_labels = vim.fn.mode(1):match("o") and "" or nil,
                    },
                }))
            end

            -- A helper function making it easier to set "clever-f" behavior
            -- (using f/F or t/T instead of ;/, - see the plugin clever-f.vim).
            local clever = require("leap.user").with_traversal_keys
            local clever_f, clever_t = clever("f", "F"), clever("t", "T")

            vim.keymap.set({ "n", "x", "o" }, "f", function()
                ft({ opts = clever_f })
            end)
            vim.keymap.set({ "n", "x", "o" }, "F", function()
                ft({ backward = true, opts = clever_f })
            end)
            vim.keymap.set({ "n", "x", "o" }, "t", function()
                ft({ offset = -1, opts = clever_t })
            end)
            vim.keymap.set({ "n", "x", "o" }, "T", function()
                ft({ backward = true, offset = 1, opts = clever_t })
            end)
        end,

        keys = {
            -- For EN keyboard layout
            { "s", mode = { "n", "x", "o" }, "<Plug>(leap)", desc = "Jump to character" },

            -- For RU keyboard layout
            { "ы", mode = { "n", "x", "o" }, "<Plug>(leap)", desc = "Jump to character" },
        },
    },
}
