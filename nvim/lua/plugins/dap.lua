
return {
    {
	"mfussenegger/nvim-dap",
	dependencies = {
	    "mfussenegger/nvim-dap-vscode-js",
	    "jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
	    local dap = require("dap")

	    require("dap-vscode-js").setup({
		debugger_path = os.getenv("HOME") .. "/.local/share/nvim/vscode-js-debug",
		adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal" },
	    })

	    dap.configurations.javascript = {
		{
		    type = "pwa-node",
		    request = "launch",
		    name = "Launch Node.js",
		    program = "${file}",
		    cwd = vim.fn.getcwd(),
		    sourceMaps = true,
		    protocol = "inspector",
		},
		{
		    type = "pwa-node",
		    request = "attach",
		    name = "Attach to Running Node.js",
		    processId = require("dap.utils").pick_process,
		}
	    }

	    dap.configurations.typescript = dap.configurations.javascript

	    dap.configurations.javascriptreact = {
		{
		    type = "pwa-chrome",
		    request = "attach",
		    name = "Attach to Chrome",
		    program = "${file}",
		    cwd = vim.fn.getcwd(),
		    sourceMaps = true,
		    protocol = "inspector",
		    port = 9222,
		}
	    }

	    dap.configurations.typescriptreact = dap.configurations.javascriptreact

	    require('dap.ext.vscode').load_launchjs(nil, {})
	end,
    },
    {
	"rcarriga/nvim-dap-ui",
	dependencies = {
	    "mfussenegger/nvim-dap",
	    "nvim-neotest/nvim-nio",
	},
	config = function ()
	    local dapui = require("dapui")
	    local dap = require("dap")

	    dapui.setup()

	    dap.listeners.after.event_initialized["dapui_config"]=function()
		dapui.open()
	    end
	    dap.listeners.before.event_terminated["dapui_config"]=function()
		dapui.close()
	    end
	    dap.listeners.before.event_exited["dapui_config"]=function()
		dapui.close()
	    end
	end
    },
}
