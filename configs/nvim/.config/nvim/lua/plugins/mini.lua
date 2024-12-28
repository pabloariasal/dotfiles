return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.cursorword').setup()
        require('mini.splitjoin').setup()
        require('mini.operators').setup()
    end
}
