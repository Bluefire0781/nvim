-- in your lazy.nvim plugin setup file
return {
    "folke/snacks.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        input = {
            enabled = true,
            win_options = {
                winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
            },
            border = "rounded",
        },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        bigfile = { enabled = true },
        dashboard = {
            sections = {
                { section = "header" },
                {
                    pane = 2,
                    section = "terminal",
                    cmd = "/run/current-system/sw/bin/colorscript -e square",
                    height = 5,
                    padding = 1,
                },
                { section = "keys", gap = 1, padding = 1 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                {
                    pane = 2,
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = function()
                        return Snacks.git.get_root() ~= nil
                    end,
                    cmd = "git status --short --branch --renames",
                    height = 5,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 3,
                },
                { section = "startup" },
            },
        },
        explorer = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
}
