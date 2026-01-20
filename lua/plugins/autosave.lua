---------
-- Auto saving all changes in edited buffer
---------

-- some recommended exclusions. you can use `:lua print(vim.bo.filetype)` to
-- get the filetype string of the current buffer
local excluded_filetypes = {
    -- this one is especially useful if you use neovim as a commit message editor
    'gitcommit',
    -- most of these are usually set to non-modifiable, which prevents autosaving
    -- by default, but it doesn't hurt to be extra safe.
    'NvimTree',
    'Outline',
    'TelescopePrompt',
    'alpha',
    'dashboard',
    'lazygit',
    'neo-tree',
    'oil',
    'prompt',
    'toggleterm',
    'scratchpad',
}

local excluded_filenames = {
    -- Arbitrary files can be added here
    -- 'do-not-autosave-me.lua'
}

local function save_condition(buf)
    if
        vim.tbl_contains(excluded_filetypes, vim.fn.getbufvar(buf, '&filetype'))
        or vim.tbl_contains(excluded_filenames, vim.fn.expand('%:t'))
        or vim.fn.getbufvar(buf, '&buftype') ~= ''
    then
        return false
    end

    return true
end

return {
    'okuuva/auto-save.nvim',
    -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
    version = '^1.0.0',
    -- optional for lazy loading on command
    cmd = 'ASToggle',
    -- optional for lazy loading on trigger events
    event = { 'InsertLeave', 'TextChanged' },

    -- enabled = false,

    opts = {
        -- Disable autosaving for certain cases
        condition = save_condition
    },
}
