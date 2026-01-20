return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            -- Disabling default virtual diagnostics text, it is enough to have icons + diagnostics jumps + search by all diagnostics
            opts.diagnostics.virtual_text = false
            return opts
        end,
    }
}
