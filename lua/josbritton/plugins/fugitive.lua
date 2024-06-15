return {
    "tpope/vim-rhubarb",
    dependencies = { "tpope/vim-fugitive" },
    lazy = true,
    cmd = {
        -- :h fugitive-commands
        "G",
        "Git",
        "Ggrep",
        "Glgrep",
        "Gclog",
        "Gllog",
        "Gcd",
        "Glcd",
        "Gedit",
        "Gsplit",
        "Gvsplit",
        "Gtabedit",
        "Gpedit",
        "Gdrop",
        "Gread",
        "Gwrite",
        "Gwq",
        "Gdiffsplit",
        "Gvdiffsplit",
        "Ghdiffsplit",
        "GMove",
        "GRename",
        "GDelete",
        "GRemove",
        "GUnlink",
        "GBrowse",
    },
    keys = {
        { "<leader>gs", "<cmd>Git<cr>", desc = "[G]it [S]tatus" },
        { "<leader>gb", "<cmd>GBrowse<cr>", desc = "[G]it [B]rowse" }
    }
}
