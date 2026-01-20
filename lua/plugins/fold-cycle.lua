---------
-- Improves nested folds folding and unfolding
---------

return {
    'jghauser/fold-cycle.nvim',

    opts = {},

    keys = {
        -- For EN keyboard layout
        { 'zO', function() require('fold-cycle').open_all() end, desc = 'Open folds (fold-cycle)' },
        { 'zC', function() require('fold-cycle').close_all() end, desc = 'Close folds (fold-cycle)' },
        { 'zA', function() require('fold-cycle').toggle_all() end, desc = 'Toggle folds (fold-cycle)' },

        -- For RU keyboard layout
        { 'яЩ', function() require('fold-cycle').open_all() end, desc = 'Open folds (fold-cycle)' },
        { 'яС', function() require('fold-cycle').close_all() end, desc = 'Close folds (fold-cycle)' },
        { 'яФ', function() require('fold-cycle').toggle_all() end, desc = 'Toggle folds (fold-cycle)' },
    }
}
