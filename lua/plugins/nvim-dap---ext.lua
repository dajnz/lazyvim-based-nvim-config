local function load_php_path_mappings()
    local cwd = vim.fn.getcwd()
    local path_json = cwd .. '/.php-path-mappings.json'

    if vim.fn.filereadable(path_json) == 1 then
        local data = vim.fn.readfile(path_json)
        local json_str = table.concat(data, '\n')
        local ok, config = pcall(vim.json.decode, json_str)

        if ok then
            return config
        else
            print('Cannot parse found PHP path mapping config for debugger .php-path-mappings.json')
        end
    end

    return {}
end

return {
    {
        'mfussenegger/nvim-dap',

        config = function()
            local dap = require('dap')

            dap.adapters = {
                php = {
                    command = 'node',
                    type = 'executable',
                    -- Use your path for phpDebug
                    args = { '/home/dajnz/Applications/vscode-php-debug/out/phpDebug.js' }
                }
            }

            dap.configurations = {
                php = {
                    {
                        type = 'php',
                        request = 'launch',
                        name = 'Listen for Xdebug',
                        port = 9003,
                        -- Considering a project has .php-path-mappings.json file in its root
                        pathMappings = load_php_path_mappings(),
                    }
                }
            }
        end,

        keys = {
            { '<leader>dL', '<cmd>DapShowLog<cr>', desc = 'Show DAP logs' },
        }
    }
}
