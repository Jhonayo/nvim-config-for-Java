return {
    'folke/which-key.nvim',
    event = 'VimEnter',
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local icons = require("nvim-web-devicons")
        local which_key = require('which-key')

        which_key.setup()

        which_key.register({
            ['<leader>/'] = { name = icons.get_icon(".bashrc") .. " Comments", _ = 'which_key_ignore' },
            ['<leader>c'] = { name = icons.get_icon(".babelrc") .. " [C]ode", _ = 'which_key_ignore' },
            ['<leader>d'] = { name = icons.get_icon(".dockerignore") .. " [D]ebug", _ = 'which_key_ignore' },
            ['<leader>e'] = { name = icons.get_icon(".SRCINFO") .. " [E]xplorer", _ = 'which_key_ignore' },
            ['<leader>f'] = { name = icons.get_icon("Default") .. " [F]ind", _ = 'which_key_ignore' },
            ['<leader>g'] = { name = icons.get_icon(".gitignore") .. " [G]it", _ = 'which_key_ignore' },
            ['<leader>J'] = {
                name = icons.get_icon(".Xauthority") .. " [J]ava",
                r = { "<cmd>lua require('modules.springboot_runner').boot_run()<CR>", icons.get_icon("rocket") .. " Run Spring Boot" },
                s = { "<cmd>lua require('modules.springboot_runner').stop()<CR>", icons.get_icon("stop") .. " Stop Spring Boot" },
                c = { "<cmd>lua require('springboot-nvim').generate_class()<CR>", icons.get_icon("class") .. " Create Class" },
                i = { "<cmd>lua require('springboot-nvim').generate_interface()<CR>", icons.get_icon("interface") .. " Create Interface" },
                e = { "<cmd>lua require('springboot-nvim').generate_enum()<CR>", icons.get_icon("enum") .. " Create Enum" },
            },
            ['<leader>t'] = { name = icons.get_icon(".Xresources") .. " [T]ab", _ = 'which_key_ignore' },
            ['<leader>w'] = { name = icons.get_icon("Default") .. " [W]indow", _ = 'which_key_ignore' }
        })

        -- Establecer los mapeos de teclas si aún no lo has hecho en otro lugar
        vim.keymap.set('n', '<leader>Jr', "<cmd>lua require('modules.springboot_runner').boot_run()<CR>", { desc = 'Run Spring Boot' })
        vim.keymap.set('n', '<leader>Js', "<cmd>lua require('modules.springboot_runner').stop()<CR>", { desc = 'Stop Spring Boot' })
        vim.keymap.set('n', '<leader>Jc', "<cmd>lua require('springboot-nvim').generate_class()<CR>", { desc = 'Create Class' })
        vim.keymap.set('n', '<leader>Ji', "<cmd>lua require('springboot-nvim').generate_interface()<CR>", { desc = 'Create Interface' })
        vim.keymap.set('n', '<leader>Je', "<cmd>lua require('springboot-nvim').generate_enum()<CR>", { desc = 'Create Enum' })
    end
}

