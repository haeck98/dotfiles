local mapKey = function(opts)
    local modes = opts[1]
    local lhs = opts[2]
    local rhs = opts[3]

    if(type(modes) ~= "table") then
        modes = {
            modes
        }
    end

    if(opts.silent ~= false) then
        opts.silent = true
    end

    for _, mode in ipairs(modes) do
        -- vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
        vim.keymap.set(
            mode,
            lhs,
            rhs,
            {
                desc = opts.desc,
                silent = opts.silent,
            }
        )
    end
end

mapKey{desc="save", "n", "<Leader>w", ":w<CR>"}
mapKey{desc="save all", "n", "<Leader>wa", ":wa<CR>"}
mapKey{desc="quit", "n", "<Leader>q", ":q<CR>"}
mapKey{desc="quit all", "n", "<Leader>qa", ":qa<CR>"}

-- NvimTree
mapKey{desc="focus nvim-tree", "n", "<Leader>e", ":NvimTreeFocus<CR>"}
mapKey{desc="find file nvim-tree", "n", "<Leader>ff", ":NvimTreeFindFile<CR>"}

-- Insert Mode
mapKey{desc="insert line below", {"i","n"}, "<C-k>", "<Esc>O", silent = false}
mapKey{desc="insert line above", {"i","n"}, "<C-j>", "<Esc>o", silent = false}

-- insert lines above/below cursor
-- mapKey{desc="move current line up", "n", "<A-k>", ":move -2<CR>"}
-- mapKey{desc="move current line down", "n", "<A-j>", ":move +1<CR>"}
-- mapKey{desc="move current line up", "i", "<A-k>", "<Esc>:move -2<CR>li"}
-- mapKey{desc="move current line down", "i", "<A-j>", "<Esc>:move +1<CR>li"}

-- move inside wrapped lines
mapKey{desc="", {"n","v"}, "j", "gj"}
mapKey{desc="", {"n","v"}, "k", "gk"}
mapKey{desc="", {"n","v"}, "gj", "j"}
mapKey{desc="", {"n","v"}, "gk", "k"}

-- quickly exit insert mode
mapKey{desc="", {"i"}, "jk", "<Esc>"}

-- clear line
mapKey{desc="Clear current line", {"n"}, "<Leader>c", "cc<Esc>"}

-- Telescope
mapKey{"n", "<Leader>sf", ":Telescope find_files<CR>"}
mapKey{"n", "<Leader>sg", ":Telescope live_grep<CR>"}
mapKey{"n", "<Leader>ss", ":Telescope lsp_document_symbols<CR>"}
mapKey{"n", "<Leader>sw", ":Telescope lsp_workspace_symbols<CR>"}
mapKey{"n", "<Leader>sr", ":Telescope lsp_references<CR>"}
mapKey{"n", "<Leader>sd", ":Telescope lsp_definitions<CR>"}
mapKey{"n", "<Leader>sD", ":Telescope diagnostics bufnr=0<CR>"}

mapKey{"n", "<Leader><Leader>", function()
    require("telescope.builtin").buffers({ sort_lastused = true, ignore_current_buffer = true })
end}

-- DAP
mapKey{desc="continue", "n", "<F5>", ":lua require'dap'.continue()<CR>"}
mapKey{desc="toggle breakpoint", "n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>"}
mapKey{desc="step over", "n", "<F10>", ":lua require'dap'.step_over()<CR>"}
mapKey{desc="step into", "n", "<F11>", ":lua require'dap'.step_into()<CR>"}
mapKey{desc="terminate", "n", "<F12>", ":lua require'dap'.terminate()<CR>"}

