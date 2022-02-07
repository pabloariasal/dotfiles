local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

vim.opt.shortmess:append "c"
vim.opt.completeopt = {"menuone", "noinsert", "noselect" }

cmp.setup {
    snippet = {
          expand = function(args)
            require('snippy').expand_snippet(args.body) -- For `snippy` users.
          end,
        },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<C-l>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          })
    },
    sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'snippy' },
        { name = 'spell' }
    }
}
