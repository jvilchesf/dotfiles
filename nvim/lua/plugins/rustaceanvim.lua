return { 
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = "rust",
    ["rust-analyzer"] = {
        cargo = {
        all_features = true,
        },
    },
}
