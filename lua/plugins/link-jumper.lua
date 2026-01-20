---------
-- Plugin for convenient jumping forward and backward by Markdown-like links inside any type of file
---------

return {
    'dajnz/link-jumper.nvim',

    opts = {},

    keys = {
        { 'gj', '<cmd>LinkJumperJump<cr>', desc = 'Jump to the link' },
        { 'gb', '<cmd>LinkJumperGoBack<cr>', desc = 'Jump back by history' },
    }
}
