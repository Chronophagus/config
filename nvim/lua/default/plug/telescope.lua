local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
    vim.notify("telescope not found")
    return
end

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Mappings to invoke telescope
keymap('n', "<C-p>", ":Telescope find_files<cr>", opts)
keymap('n', "<leader>h", ":Telescope oldfiles<cr>", opts)
keymap('n', "<leader>b", ":Telescope buffers<cr>", opts)
keymap('n', "<leader>f", ":Telescope live_grep<cr>", opts)

-- Telescope window mappings
local custom_mappings = {
    i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
    }
}

telescope.setup {
    path_display = { "smart" },

    defaults = {
        mappings = custom_mappings,
    }
}

telescope.load_extension("fzf")
