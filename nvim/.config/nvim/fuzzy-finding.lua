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
    git_icons = false,
    fd_opts   = vim.env.FZF_DEFAULT_COMMAND:gsub("^fd", ""),
  },
  tags = {
    fzf_opts = {
      ['--nth'] = '2',
      ['--tiebreak'] = 'begin',
      ["--delimiter"] = vim.fn.shellescape(' '),
    },
  },
  btags = {
    fzf_opts = {
      ['--nth'] = '1',
      ['--tiebreak'] = 'begin',
    },
  }
}
