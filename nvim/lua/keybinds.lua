local mapKey = function(opts)
    local modes = opts[1]
    local lhs = opts[2]
    local rhs = opts[3]

    if(type(modes) ~= "table") then
        modes = {
            modes
        }
    end
    for _, mode in ipairs(modes) do
        -- vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
        vim.keymap.set(
            mode,
            lhs,
            rhs,
            {
                desc = opts.desc,
            }
        )
    end
end

mapKey{desc="save", "n", "<Leader>w", ":w<CR>"}
mapKey{desc="save all", "n", "<Leader>wa", ":wa<CR>"}
mapKey{desc="quit", "n", "<Leader>q", ":q<CR>"}
mapKey{desc="quit all", "n", "<Leader>qa", ":wa<CR>:qa<CR>"}

mapKey{desc="fous nvim-tree", "n", "<Leader>e", ":NvimTreeFocus<CR>"}

-- Insert Mode
mapKey{desc="insert line below", {"i","n"}, "<C-k>", "<Esc>O"}
mapKey{desc="insert line above", {"i","n"}, "<C-j>", "<Esc>o"}

-- insert lines above/below cursor
mapKey{desc="move current line up", "n", "<A-k>", ":move -2<CR>"}
mapKey{desc="move current line down", "n", "<A-j>", ":move +1<CR>"}
mapKey{desc="move current line up", "i", "<A-k>", "<Esc>:move -2<CR>li"}
mapKey{desc="move current line down", "i", "<A-j>", "<Esc>:move +1<CR>li"}

-- move inside wrapped lines
mapKey{desc="", {"n","v"}, "j", "gj"}
mapKey{desc="", {"n","v"}, "k", "gk"}
mapKey{desc="", {"n","v"}, "gj", "j"}
mapKey{desc="", {"n","v"}, "gk", "k"}

-- clear line
mapKey{desc="Clear current line", {"n"}, "<Leader>c", "cc<Esc>"}

-- Telescope
mapKey{"n", "<Leader>sf", ":Telescope find_files<CR>"}
mapKey{"n", "<Leader>sg", ":Telescope live_grep<CR>"}
mapKey{"n", "<Leader><Leader>", ":Telescope buffers<CR>"}
