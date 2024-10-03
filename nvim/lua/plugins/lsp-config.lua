return {
    "williamboman/mason-lspconfig.nvim",
    enabled=true,
    dependencies = {
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function(opts)
	require("mason").setup();
	require("mason-lspconfig").setup({
	    ensure_installed = {
		"lua_ls",
		"angularls",
		"ts_ls",
		"cssls",
		"html",
	    },
	});
	require("mason-lspconfig").setup_handlers {
	    function (server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {}
	    end,
	}
    end,
}
