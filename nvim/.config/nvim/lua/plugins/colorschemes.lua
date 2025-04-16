return {
    {
	"sainnhe/sonokai",
	config = function()
	    vim.g.sonokai_better_performance = 1
	    vim.g.sonokai_transparent_background = 2
	    vim.cmd([[colorscheme sonokai]])
	end,
    },
}
