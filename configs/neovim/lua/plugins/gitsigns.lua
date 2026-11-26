-- Yoinked straight from `adibhanna/nvim`
return {
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        keys = {
            -- Hunk operations under <leader>gh (git hunk)
            { "<leader>ghp", function() require("gitsigns").preview_hunk() end, desc = "Preview Hunk" },
            { "<leader>ghP", function() require("gitsigns").preview_hunk_inline() end, desc = "Preview Hunk Inline" },
            { "<leader>ghs", function() require("gitsigns").stage_hunk() end, desc = "Stage Hunk" },
            { "<leader>ghu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo Stage Hunk" },
            { "<leader>ghr", function() require("gitsigns").reset_hunk() end, desc = "Reset Hunk" },
            -- Buffer operations
            { "<leader>gR", function() require("gitsigns").reset_buffer() end, desc = "Reset Buffer" },
            { "<leader>gS", function() require("gitsigns").stage_buffer() end, desc = "Stage Buffer" },
            -- Blame
            { "<leader>gb", function() require("gitsigns").blame_line() end, desc = "Blame Line" },
            { "<leader>gB", function() require("gitsigns").blame() end, desc = "Blame Buffer" },
            -- Diff
            { "<leader>gD", function() vim.cmd("Gitsigns diffthis HEAD") end, desc = "Diff HEAD" },
        },
    },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    },
}
