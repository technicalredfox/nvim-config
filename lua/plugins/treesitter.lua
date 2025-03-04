return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        -- ts-autotag utilizes treesitter to understand the code stucture to automatically close tsx tags
        "windwp/nvim-ts-autotag"
    },
    -- when the plugin builds run the TSUpdate command to ensure all the language servers are installed and updated
    build = ':TSUdate',
    config = function()
    -- gain access to treesitter's config functions
    local ts_config = require("nvim-treesitter.configs")

    -- call the treesitter setup function with properties for configuration
    ts_config.setup({
        -- ensure that have following language servers installed
        ensure_installed = {"vim", "vimdoc", "lua", "java", "javascript", "typescript", "html", "css", "json", "tsx", "markdown", "markdown_inline", "gitignore"},
        -- ensure highlighting is enabled
        highlight = {enable = true},
        -- enable tsx auto closing tag creation
        autotag = {enable = true}
        })
    end
}
