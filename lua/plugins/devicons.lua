-- lua/plugins/devicons.lua
return {
    "nvim-tree/nvim-web-devicons",
    config = function()
        require("nvim-web-devicons").setup({
            -- Puedes personalizar configuraciones aquí si es necesario
            default = true,
        })
    end
}

