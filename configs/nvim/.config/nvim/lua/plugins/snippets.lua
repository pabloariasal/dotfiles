return {
    'dcampos/nvim-snippy',
    opts = {
        scopes = {
            cpp = { '_', 'cpp', 'gtest' },
            sh = { 'bash', 'zsh' },
            html = { 'html', 'reveal' },
        },
        mappings = {
            is = {
                ['<c-space>'] = 'expand_or_advance',
                ['<c-j>'] = 'next',
                ['<c-k>'] = 'previous',
            },
            nx = {
                ['<c-space>'] = 'cut_text',
            },
        },
    }
}
