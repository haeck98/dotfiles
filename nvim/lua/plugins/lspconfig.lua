return {
  -- Mason plugin for managing LSP servers
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()  -- Initialize Mason
    end,
  },

  -- mason-lspconfig plugin to integrate Mason with lspconfig
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      -- Automatically install and configure the LSP servers
      require('mason-lspconfig').setup({
        ensure_installed = {
		"lua_ls",
		"angularls",
		"ts_ls",
		"cssls",
		"html",
	},  -- List your preferred LSPs here
      })
    end,
  },

  -- nvim-lspconfig for configuring LSP servers
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Define a function to handle LSP server setup
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- Set keybindings for LSP functions
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      end

      -- Setup the handler for all LSP servers using `setup_handlers`
      local lspconfig = require('lspconfig')
      require('mason-lspconfig').setup_handlers({
	  -- This handler will be used for all servers
	  function(server_name)
	      local opts = {
		  on_attach = on_attach,  -- Apply the `on_attach` function
		  capabilities = vim.lsp.protocol.make_client_capabilities(),
	      }

	      if (server_name == "gopls") then
		  opts.cmd = {"gopls"}
		  opts.filetypes = {"go", "gomod", "gowork", "gotmpl"}
		  opts.root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git")
		  opts.settings = {
		      gopls = {
			  completeUnimported = true,
		      },
		  }
	      end

	      lspconfig[server_name].setup(opts)
	  end,
      })
  end,
  },
}

