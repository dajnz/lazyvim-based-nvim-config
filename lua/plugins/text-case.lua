---------
-- Plugin for converting text case (like snake_case to CamelCase)
---------

return {
    'johmsalas/text-case.nvim',
    lazy = false,

    config = function()
        require('textcase').setup({})
    end,

    cmd = {
        'Subs',
        'TextCaseStartReplacingCommand',
    },
}
