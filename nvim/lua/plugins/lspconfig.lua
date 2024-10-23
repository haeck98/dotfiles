-- return {
--     "williamboman/mason-lspconfig.nvim",
--     enabled=true,
--     dependencies = {
-- 	"williamboman/mason.nvim",
-- 	"neovim/nvim-lspconfig",
--     },
--     event = { "BufReadPre", "BufNewFile" },
--     config = function(opts)
-- 	require("mason").setup();
-- 	require("mason-lspconfig").setup({
-- 	    ensure_installed = {
-- 		"lua_ls",
-- 		"angularls",
-- 		"ts_ls",
-- 		"cssls",
-- 		"html",
-- 	    },
-- 	});
-- 	require("mason-lspconfig").setup_handlers {
-- 	    function (server_name) -- default handler (optional)
-- 		require("lspconfig")[server_name].setup {}
-- 	    end,
-- 	}
--     end,
-- }

return {
    {
	"williamboman/mason.nvim",
	opts = {
	    ensure_installed = {
		"lua_ls",
		"angularls",
		"ts_ls",
		"cssls",
		"html",
		"gopls",
	    },
	},
    },
    {
	"williamboman/mason-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
	    "neovim/nvim-lspconfig",
	},
	config = function(opts)
	    require("mason-lspconfig").setup_handlers {
		function (server_name) -- default handler (optional)
		    if (server_name == "gopls") then
			require("lspconfig").gopls.setup {
			    cmd = {"gopls"},
			    filetypes = {"go", "gomod", "gowork", "gotmpl"},
			    root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
			    settings = {
				gopls = {
				    completeUnimported = true,
				},
			    },
			}
		    else
			require("lspconfig")[server_name].setup {}
		    end
		end,
	    }
	end,

    },
}
