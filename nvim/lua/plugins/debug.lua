return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'williamboman/mason.nvim',
      'nvim-neotest/nvim-nio',  -- ⬅️ Add this line
    },
    config = function()
      local function setup_debugger()
        local ok_dap, dap = pcall(require, 'dap')
        local ok_registry, mason_registry = pcall(require, 'mason-registry')
        if not (ok_dap and ok_registry) then
          vim.notify('[DAP] Required modules missing', vim.log.levels.ERROR)
          return
        end

        mason_registry.refresh()

        if not mason_registry.is_installed('codelldb') then
          vim.notify('[DAP] codelldb is not installed — run :MasonInstall codelldb', vim.log.levels.WARN)
          return
        end

        -- Calculate the install directory using the Mason data path:
        local MasonPath = vim.fn.getenv("MASON")
                         or vim.fn.stdpath("data") .. "/mason"
        local ext = MasonPath .. "/packages/codelldb/extension"
        local codelldb_bin = ext .. "/adapter/codelldb"
        local liblldb = ext .. "/lldb/lib/liblldb" ..
                        (vim.fn.has('mac') == 1 and '.dylib' or '.so')

        dap.adapters.codelldb = {
          type = 'server',
          port = '${port}',
          executable = {
            command = codelldb_bin,
            args = { '--port', '${port}' },
          },
        }

        dap.configurations.rust = {
          {
            name = 'Launch',
            type = 'codelldb',
            request = 'launch',
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
          },
        }

        -- Debug UI and keymaps
        local dapui = require('dapui')
        dapui.setup()
        dap.listeners.after.event_initialized['dapui']    = function() dapui.open() end
        dap.listeners.before.event_terminated['dapui']    = function() dapui.close() end
        dap.listeners.before.event_exited['dapui']        = function() dapui.close() end

        local keymaps = {
          {'<F5>', dap.continue}, {'<F10>', dap.step_over},
          {'<F11>', dap.step_into}, {'<F12>', dap.step_out},
          {'<leader>b', dap.toggle_breakpoint},
          {'<leader>B', function() dap.set_breakpoint(vim.fn.input('Cond: ')) end},
          {'<leader>lp', function() dap.set_breakpoint(nil,nil,vim.fn.input('Log: ')) end},
          {'<leader>dr', dap.repl.open}, {'<leader>dl', dap.run_last},
        }
        for _, m in ipairs(keymaps) do
          vim.keymap.set('n', m[1], m[2], {desc='Debug', silent=true})
        end
      end

      vim.defer_fn(setup_debugger, 100)
      vim.api.nvim_create_autocmd('User', {
        pattern = 'MasonToolsUpdateCompleted',
        callback = setup_debugger,
      })
    end,
  },
  { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap' } },
}
