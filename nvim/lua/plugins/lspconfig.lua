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

      end

      -- Setup the handler for all LSP servers using `setup_handlers`
      local lspconfig = require('lspconfig')
      require('mason-lspconfig').setup_handlers({
	-- This handler will be used for all servers
	function(server_name)
	  local opts = {
	    on_attach = on_attach,  -- Apply the `on_attach` function
	    -- capabilities = vim.lsp.protocol.make_client_capabilities(),
	  }

	  if server_name == "gopls" then
	    opts.cmd = {"gopls"}
	    opts.filetypes = {"go", "gomod", "gowork", "gotmpl"}
	    opts.root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git")
	    opts.settings = {
	      gopls = {
		completeUnimported = true,
	      },
	    }
	  elseif server_name == "jsonls" then
	    opts.filetypes = {"json", "jsonc"}
	    opts.settings = {
	      json = {
		schemas = {
		  {
		    fileMatch = {"package.json"},
		    url = "https://json.schemastore.org/package.json",
		  },
		  {
		    fileMatch = {"tsconfig*.json"},
		    url = "https://json.schemastore.org/tsconfig.json",
		  },
		  {
		    fileMatch = {".prettierrc", ".prettierrc.json", "prettier.config.json"},
		    url = "https://json.schemastore.org/prettierrc.json",
		  },
		  {
		    fileMatch = {".eslintrc", ".eslintrc.json"},
		    url = "https://json.schemastore.org/eslintrc.json",
		  },
		  {
		    fileMatch = {".babelrc", ".babelrc.json", "babel.config.json"},
		    url = "https://json.schemastore.org/babelrc.json",
		  },
		  {
		    fileMatch = {"lerna.json"},
		    url = "https://json.schemastore.org/lerna.json",
		  },
		  {
		    fileMatch = {"now.json", "vercel.json"},
		    url = "https://json.schemastore.org/now.json",
		  },
		  {
		    fileMatch = {".stylelintrc", ".stylelintrc.json", "stylelint.config.json"},
		    url = "http://json.schemastore.org/stylelintrc.json",
		  },
		},
	      },
	    }
	  end

	  lspconfig[server_name].setup(opts)
	end,
      })
    end,
  },
}

