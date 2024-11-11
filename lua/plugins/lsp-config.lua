return {
    -- Mason y configuración de LSP
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = { border = "rounded" },
            })
        end,
    },
    {
    "hrsh7th/nvim-cmp",              -- Plugin principal de autocompletado
    "hrsh7th/cmp-nvim-lsp",          -- Complemento de nvim-cmp para LSP
    },
    -- Mason LSP Config para instalar automáticamente los servidores LSP
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "jdtls", "html", "ts_ls", "cssls" },
            })
        end,
    },
-- Mason nvim DAP para depuración (Debug Adapter Protocol)
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug-adapter", "java-test" },
            })
        end,
    },
    -- Configuración avanzada de Java con nvim-jdtls
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",          -- Plugin necesario para depuración
            "ray-x/lsp_signature.nvim"        -- Plugin para mostrar firmas de funciones
        },
        config = function()
            -- Configuración de Java Development Tools (JDTLS) específica
            require("jdtls").start_or_attach({
                cmd = { "jdtls" },
                root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }), -- Busca el directorio raíz del proyecto
            })
        end,
    },
    -- lsp_signature.nvim para firmas de funciones en todos los lenguajes
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup({
                hint_prefix = "🔍 ", -- Personaliza el prefijo de las sugerencias
            })
        end,
    },
-- hasta aqui se escuentra sin error
    -- nvim-lspconfig: Configuración LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Configuración de servidores LSP
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })
            lspconfig.jdtls.setup({ capabilities = capabilities })
            lspconfig.cssls.setup({ capabilities = capabilities })

            -- Configuración de diagnósticos personalizados
            vim.diagnostic.config({
                signs = true,
                virtual_text = false,
                underline = true,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                },
            })

            -- Definir signos de diagnóstico personalizados
            for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
            end

            -- Mapas de teclas para navegación y acciones LSP
            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
            vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
        end,
    },
}


