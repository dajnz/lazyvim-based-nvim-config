return {
    {
        "mfussenegger/nvim-lint",

        opts = {
            linters_by_ft = {
                fish = { "fish" },
                make = { "checkmake" },
                dockerfile = { "hadolint" },
                yaml = { "yamllint" },

                -- Use the "*" filetype to run linters on all filetypes.
                -- ['*'] = { 'global linter' },

                -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
                -- ['_'] = { 'fallback linter' },
                -- ["*"] = { "typos" },
            },
        },
    },
}
