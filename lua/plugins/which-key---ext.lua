---------
-- WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup
---------

return {
    {
        'folke/which-key.nvim',

        -- A fix for issues when using RU keyboard layout
        -- @see: https://github.com/Wansmer/langmapper.nvim/discussions/11#discussioncomment-11210683
        config = function(_, opts)
            local cmd = { 'xkblayout-state', 'print', '%s' }
            local has_cmd = vim.fn.executable(cmd[1]) == 1
            local lmu = require 'langmapper.utils'
            local wk_state = require 'which-key.state'
            local check_orig = wk_state.check
            ---@diagnostic disable-next-line: duplicate-set-field
            wk_state.check = function(state, key)
                if key ~= nil then
                    local ambiguous = key == '.' or key == ',' or key == '/'
                    if not ambiguous or has_cmd and vim.system(cmd):wait().stdout == 'ru' then
                        key = lmu.translate_keycode(key, 'default', 'ru')
                    end
                end
                return check_orig(state, key)
            end

            require('which-key').setup(opts)
        end,

        opts = {
            spec = {
                {
                    { "<leader>k", group = "Kulala HTTP" },
                    { "<leader>m", group = "marks" },
                }
            }
        }
    }
}
