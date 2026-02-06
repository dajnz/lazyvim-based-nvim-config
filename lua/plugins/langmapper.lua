---------
-- Helper for remapping hotkeys when using non EN keyboard layout
---------

return {
    'Wansmer/langmapper.nvim',
    lazy = false,
    -- High priority is needed if you will use `autoremap()`
    priority = 1,

    -- A fix for issues when using RU keyboard layout
    -- @see: https://github.com/Wansmer/langmapper.nvim/discussions/11#discussioncomment-11210683
    config = function(_, opts)
        local lm = require "langmapper"

        lm.setup(opts)
        lm.hack_get_keymap()

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyDone",
            once = true,
            callback = function()
                lm.automapping { global = true, buffer = false }
            end,
        })
    end,

    opts = {
        -- Removed letters '~' and '`' because it incorrectly maps them to 'Ё' and 'ё'
        -- This is because I'm using Mac aluminum keyboard
        default_layout = [[ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{}abcdefghijklmnopqrstuvwxyz,.;[]']],

        layouts = {
            ru = {
                -- Removed letters 'Ё' and 'ё' because it incorrectly maps them to '~' and '`'
                -- This is because I'm using Mac aluminum keyboard
                layout = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪфисвуапршолдьтщзйкыегмцчнябюжхъэ'
            }
        }
    }
}
