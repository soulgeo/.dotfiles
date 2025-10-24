return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            toggler = {
                line = "<leader>/", -- comment/uncomment current line
            },
            opleader = {
                line = "<leader>/", -- comment/uncomment selection in visual mode
            },
        })
    end,
}
