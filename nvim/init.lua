require("init-lazy")

require("settings")
require("keybinds")
require("config.jsp-support")

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})


