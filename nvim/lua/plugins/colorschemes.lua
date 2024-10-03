return {
    {
	"sainnhe/sonokai",
	config = function()
	    vim.g.sonokai_better_performance = 1
	    vim.cmd([[colorscheme sonokai]])
	end,
    },
}
