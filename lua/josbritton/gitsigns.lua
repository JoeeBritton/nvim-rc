local gitsigns = require("gitsigns")

local M = {}

local function on_attach(bufnr)
    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
    end

    map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage git hunk" })

    map("v", "<leader>hs", function()
        gitsigns.stage_hunk
        { vim.fn.line("."), vim.fn.line("v") }
    end, { desc = "Stage git hunk" })

    map("n", "<leader>hr", gitsigns.reset_hunk,
        { desc = "Reset git hunk" })
    map("v", "<leader>hr", function()
        gitsigns.reset_hunk
        { vim.fn.line("."), vim.fn.line("v") }
    end, { desc = "Reset git hunk" })

    map({ "n", "v" }, '<leader>hS', gitsigns.stage_buffer, { desc = "Stage git buffer" })

    map({ "n", "v" }, '<leader>hu', gitsigns.undo_stage_hunk, { desc = "Undo stage git hunk" })

    map({ "n", "v" }, '<leader>hR', gitsigns.reset_buffer, { desc = "Reset git buffer" })

    map({ "n", "v" }, '<leader>hp', gitsigns.preview_hunk, { desc = "Preview git hunk" })

    map({ "n", "v" }, '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "Toggle current git blame line" })

    map({ "n", "v" }, '<leader>td', gitsigns.toggle_deleted, { desc = "Git toggle deleted" })

    map({ "o", "x", "v" }, "ih", gitsigns.select_hunk, { desc = "Select git hunk from text object" })

    -- don't override the built-in and fugitive keymaps
    local gs = package.loaded.gitsigns
    map({ "n", "v" }, "]c", function()
        if vim.wo.diff then
            return "]c"
        end
        vim.schedule(function()
            gs.next_hunk()
        end)
        return "<Ignore>"
    end, { expr = true, desc = "Jump to next hunk" })
    map({ "n", "v" }, "[c", function()
        if vim.wo.diff then
            return "[c"
        end
        vim.schedule(function()
            gs.prev_hunk()
        end)
        return "<Ignore>"
    end, { expr = true, desc = "Jump to previous hunk" })

    map('n', '<leader>hb', function()
        gitsigns.blame_line({ full = true })
    end)
end

M.setup = function()
    gitsigns.setup({
        max_file_length = 100000,
        signs = {
            add          = { text = "+", show_count = false },
            change       = { text = "~", show_count = false },
            delete       = { text = "-", show_count = false },
            topdelete    = { text = "‾", show_count = false },
            changedelete = { text = "~", show_count = false },
            untracked    = { text = "┆", show_count = false },
        },
        status_formatter = function(_)
            return ""
        end,
        on_attach = on_attach,
        preview_config = {
            border = "rounded",
        },
        current_line_blame = false,
        update_debounce = 50,
        attach_to_untracked = true,
        word_diff = false,
    })
end

M.setup()

return M
