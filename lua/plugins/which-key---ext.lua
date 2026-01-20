---------
-- WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup
---------

return {
    {
        'folke/which-key.nvim',
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
