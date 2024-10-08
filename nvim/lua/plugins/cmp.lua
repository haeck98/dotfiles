return {
    "hrsh7th/nvim-cmp",
    dependencies = {
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
    },
    config = function()
	local cmp = require("cmp")

	cmp.setup({
	    mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
		    behavior = cmp.ConfirmBehavior.Replace,
		    select = false,
		}),
	    }),
	    sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{
		    name = 'cmdline',
		    option = {
			ignore_cmds = { 'Man', '!' }
		    }
		}
	    }),
	})

	vim.cmd([[
	    set completeopt=menuone,noinsert,noselect
	    highlight! default link CmpItemKind CmpItemMenuDefault
	]])
    end,
}
