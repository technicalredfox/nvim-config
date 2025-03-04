return {
    {
        "williamboman/mason.nvim",
        config = function()
            -- setup mason with defaults
            require("mason").setup()
        end
    },
    -- mason lsp config utilizes mason to automatically ensure lsp servers are installed
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            -- ensure all the language servers are installed
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls","ts_ls","jdtls"}
            })
        end
    },
    -- mason nvim dap utilizes mason to automatically ensure debug adapters are installed
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            -- ensure that java adapters are installed
            require("mason-nvim-dap").setup({
                ensure_installed = {"java-debug-adapter","java-test"}
            })
        end
    },
    -- utility plugin for configuring the java language server
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- get access to the lspconfig plugins functions
            local lspconfig = require("lspconfig")

             local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- set up the lua language server
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            -- set up the typescript language server
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

            -- set vim motion <Space> + c + h to show show code documentation about the code the cursor is currently over if avialable
            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over documentation" })
            -- set vim motion <Space> + c + d to go where the code/variable under the cursor is defined
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode [D]efination"})
            -- set vim motion <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
            vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            -- set vim motion <Space> + c + r to display references to the code under the cursor
            vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode goto [R]eferences" })
            -- set vim motion <Space> + c + i to display implementations to the code under the cursor
            vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[C]ode goto [I]mplementations" })
            -- set vim motion <Space> + c + <Shift>R to smartly rename the code under the cursor
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
            -- set vim motion <Space> + c + <Shift>D to go to where the code/object was declared in the project
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode goto [D]eclaration" })
        end
    }
}
