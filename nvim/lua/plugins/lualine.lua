return {
    "nvim-lualine/lualine.nvim",
    enable = true,
    config = function ()
    	local lualine = require("lualine");
	lualine.setup();
    end
}
