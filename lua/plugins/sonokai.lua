---------
-- Preferred color theme
---------

return {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,

    config = function()
        -- Preferred color variant
        vim.g.sonokai_style = 'shusia'
        vim.g.sonokai_enable_italic = true
        -- No italic in comments
        vim.g.sonokai_disable_italic_comment = true
        vim.g.sonokai_cursor = 'orange'
        -- Custom colors for diagnostic texts
        vim.g.sonokai_diagnostic_virtual_text = 'highlighted'
    end
}
