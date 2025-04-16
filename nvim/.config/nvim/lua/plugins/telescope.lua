return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
    },
    config = function()
	require("telescope").setup {
	    extensions = {
		fzf = {
		    fuzzy = true,
		    override_generic_sorter = true,
		    override_file_sorter = true,
		    case_mode = "smart_case",
		}
	    }
	}

	require('telescope').load_extension('fzf')
    end,
}
