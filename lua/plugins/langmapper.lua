---------
-- Helper for remapping hotkeys when using non EN keyboard layout
---------

return {
    'Wansmer/langmapper.nvim',
    lazy = false,
    -- High priority is needed if you will use `autoremap()`
    priority = 1,

    opts = {
        -- Removed letters '~' and '`' because it incorrectly maps them to 'Ё' and 'ё',
        -- but on my keyboard it should be mapped to '|' and '\', and I need '\' for Flash hotkey
        default_layout = [[ABCDEFGHIJKLMNOPQRSTUVWXYZ<>:"{}abcdefghijklmnopqrstuvwxyz,.;[]']],

        layouts = {
            ru = {
                -- Removed letters 'Ё' and 'ё' because it incorrectly maps them to '~' and '`',
                -- but on my keyboard it should be mapped to '|' and '\', and I need '\' for Flash hotkey
                layout = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯБЮЖЭХЪфисвуапршолдьтщзйкыегмцчнябюжхъэ'
            }
        }
    }
}
