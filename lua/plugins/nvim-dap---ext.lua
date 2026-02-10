local function load_php_path_mappings()
    local cwd = vim.fn.getcwd()
    local path_json = cwd .. "/.php-path-mappings.json"

    if vim.fn.filereadable(path_json) == 1 then
        local data = vim.fn.readfile(path_json)
        local json_str = table.concat(data, "\n")
        local ok, config = pcall(vim.json.decode, json_str)

        if ok then
            return config
        else
            print("Cannot parse found PHP path mapping config for debugger .php-path-mappings.json")
        end
    end

    return {}
end

return {
    {
        "mfussenegger/nvim-dap",

        config = function()
            local dap = require("dap")

            dap.adapters = {
                php = {
                    command = "node",
                    type = "executable",
                    -- Use your path for phpDebug
                    args = { "/home/dajnz/apps/vscode-php-debug/out/phpDebug.js" },
                },
            }

            dap.configurations = {
                php = {
                    {
                        type = "php",
                        request = "launch",
                        name = "Listen for Xdebug",
                        port = 9003,
                        -- Considering a project has .php-path-mappings.json file in its root
                        -- The file should be a map with in-container abs path => host system abs path
                        -- Make sure port 9003 is allowed in your local firewall
                        pathMappings = load_php_path_mappings(),
                    },
                },
            }

            -- Colors for lines with breakpoints
            vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
            vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
            vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

            -- Config for breakpoints icons
            vim.fn.sign_define(
                "DapBreakpoint",
                { text = "●", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
            )
            vim.fn.sign_define(
                "DapBreakpointCondition",
                { text = "󰯲", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
            )
            vim.fn.sign_define(
                "DapBreakpointRejected",
                { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
            )
            vim.fn.sign_define(
                "DapLogPoint",
                { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
            )
            vim.fn.sign_define(
                "DapStopped",
                { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
            )
        end,

        keys = {
            { "<leader>dL", "<cmd>DapShowLog<cr>", desc = "Show DAP logs" },
        },
    },
}
