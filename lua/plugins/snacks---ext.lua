return {
    {
        "folke/snacks.nvim",
        opts = {
            scroll = { enabled = false },
            picker = {
                sources = {
                    files = {
                        exclude = { "node_modules", "vendor" },
                    },
                    grep = {
                        exclude = { "node_modules", "vendor" },
                    },
                },
            },
        },
    },
}
