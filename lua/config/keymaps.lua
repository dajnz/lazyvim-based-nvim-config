-- Getting config object for convenience
local o = vim.opt
local nmap = require('config.utils').nmap
local escape = require('config.utils').escape

---------
-- Langmap config for RU keys proper handling
---------

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]


o.langmap = vim.fn.join(
    {
        -- | `to` should be first     | `from` should be second
        escape(ru_shift) .. ';' .. escape(en_shift),
        escape(ru) .. ';' .. escape(en),
    },
    ','
)

---------
-- Fixes for some shortcuts on RU keyboard layout
---------

-- Allows vertical navigation through soft wrapped strings with 'j' and 'k'
nmap('о', 'gj')
nmap('л', 'gk')
-- Last command repeat
nmap('ю', '.')
-- Creation of new mark
nmap('ь', 'm')
-- Re-do of all recent undo-s
nmap('Ctrl-к', 'Ctrl-r')
