---------
-- Convenient window switcher for opened windows
---------

return {
    'yorickpeterse/nvim-window',

    opts = {
        normal_hl = 'Substitute',

        -- Disable window hiding for Snacks file explorer window
        close_window = function (_, win_conf)
          if win_conf.relative == 'win' and win_conf.focusable == true and win_conf.hide == false then
            return false
          end

          return true
        end
    },

    keys = {
        -- For EN keyboard layout
        { '<leader>ww', function() require('nvim-window').pick() end, desc = 'Jump to window' },

        -- For RU keyboard layout
        { '<leader>цц', function() require('nvim-window').pick() end, desc = 'Jump to window' },
    },
}
