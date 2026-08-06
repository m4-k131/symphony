return {
  -- DAP: Core debugging protocol
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap-python",
    },
    keys = {
      { "<leader>dc", function() require("dap").continue() end, desc = "DAP: Continue" },
      { "<leader>do", function() require("dap").step_over() end, desc = "DAP: Step Over" },
      { "<leader>di", function() require("dap").step_into() end, desc = "DAP: Step Into" },
      { "<leader>du", function() require("dap").step_out() end, desc = "DAP: Step Out" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP: Toggle Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "DAP: Conditional Breakpoint" },
      { "<leader>dr", function() require("dap").repl.open() end, desc = "DAP: Open REPL" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "DAP: Terminate" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      -- Auto open/close DAP UI
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
      dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

      -- Python adapter via debugpy
      require("dap-python").setup("python")
    end,
  },
}
