return {
    --	{ "rcarriga/nvim-notify" },
    { "tpope/vim-sleuth" },
    { "justinmk/vim-sneak" },
    {
	"kylechui/nvim-surround",
	event = "VeryLazy",
	config = function()
	    require("nvim-surround").setup({})
	end,
    },
}
