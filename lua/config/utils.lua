---------
-- Helpers for NeoVim config
---------

local M = {}

-- Remapping keys for normal mode
function M.nmap(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, { silent = true, desc = desc })
end

-- Remapping keys for input mode
function M.imap(lhs, rhs, desc)
    vim.keymap.set('i', lhs, rhs, { silent = true, desc = desc })
end

-- Remapping keys for command line mode
function M.cmap(lhs, rhs, desc)
    vim.keymap.set('c', lhs, rhs, { silent = true, desc = desc })
end

-- Escaping special characters for mapping RU keys
function M.escape(str)
    -- You need to escape these characters to work correctly
    local escape_chars = [[;,."|\]]
    return vim.fn.escape(str, escape_chars)
end

return M
