-- lua/plugins/springboot-nvim.lua
return {
    "elmcgill/springboot-nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-jdtls"
    },
    config = function()
        local springboot_nvim = require("springboot-nvim")
        local runner = require("modules.springboot_runner") -- Asegúrate de que la ruta es correcta

        -- Asignar las funciones al mapeo de teclas
        vim.keymap.set('n', '<leader>Jr', runner.boot_run, {desc = "[J]ava [R]un Spring Boot"})
        vim.keymap.set('n', '<leader>Js', runner.stop, {desc = "[J]ava [S]top Spring Boot"})

        -- Mantenemos los demás mapeos
        vim.keymap.set('n', '<leader>Jc', springboot_nvim.generate_class, {desc = "[J]ava Create [C]lass"})
        vim.keymap.set('n', '<leader>Ji', springboot_nvim.generate_interface, {desc = "[J]ava Create [I]nterface"})
        vim.keymap.set('n', '<leader>Je', springboot_nvim.generate_enum, {desc = "[J]ava Create [E]num"})

        -- Configuración del plugin
        springboot_nvim.setup({})
    end
}

