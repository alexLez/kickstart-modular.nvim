return {
    "diegoulloao/neofusion.nvim",
    priority = 1000,
    config = function()
        require("neofusion").setup({
        })
        -- vim.cmd([[ colorscheme neofusion ]])
    end,
}
