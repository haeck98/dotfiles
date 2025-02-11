return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
	require("nvim-treesitter.configs").setup({

	    highlight = { enable = true },
	    indent = { enable = true },
	    incremental_selection = { enable = true },
	    injections = { enable = true }
	})
    end,
}
