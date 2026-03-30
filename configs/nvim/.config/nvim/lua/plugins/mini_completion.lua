return {
    "nvim-mini/mini.completion",
    version = "*",
    opts = {
        mappings = {
            -- Force two-step/fallback completions
            force_twostep = "",
            force_fallback = "",

            -- Scroll info/signature window down/up. When overriding, check for
            -- conflicts with built-in keys for popup menu (like `<C-u>`/`<C-o>`
            -- for 'completefunc'/'omnifunc' source function; or `<C-n>`/`<C-p>`).
            -- scroll_down = "<C-f>",
            -- scroll_up = "<C-b>",
        },
    },
}
