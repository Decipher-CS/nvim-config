return {
        'rcarriga/nvim-notify',
        opts = {
                stages = "fade_in_slide_out",
                render = "compact",
                timeout = 2000,
        },
        init = function()
                vim.opt.termguicolors = true
                vim.notify = require('notify')
        end,
}
