vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")

require("nvim-dap-virtual-text").setup()
require("dapui").setup()



local dap = require('dap')
local dapui = require('dapui')
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_initialized["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- Recordar de hacer la compilacion con simbolos de debug
-- cmake agregar set(CMAKE_BUILD_TYPE Debug)
-- Descargar de https://github.com/microsoft/vscode-cpptools una relsease .vsix
-- poner eso en .local/share/cpptools y hacer chmod +x de bin/OpenDebugAD7
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/home/mmazz/.local/share/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

dap.configurations.cpp = {
    {
        name = "g++ - Build and debug active file",
        type = "cppdbg",
        request = "launch",
        program = "${workspaceFolder}/bin/${fileBasenameNoExtension}",
        stopAtEntry = false,
        cwd = "${workspaceFolder}",
        console = "externalTerminal",
        MIMode = "gdb",
        setupCommands = {
            {
                description = "Enable pretty-printing for gdb",
                text = "-enable-pretty-printing",
                ignoreFailures = true
            }
        },
        preLaunchTask = "C/C++: g++ build active file",
        miDebuggerPath = "/usr/bin/gdb"
    }
}


