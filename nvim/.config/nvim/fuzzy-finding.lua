require'fzf-lua'.setup {
  winopts = {
    split = 'belowright new',
    border = 'none',
    preview = {
      hidden = 'hidden'
   }
  },
  fzf_opts = {
    ['--info'] = 'hidden',
    layout = false,
  },
  files = {
    git_icons = false
  }
}
