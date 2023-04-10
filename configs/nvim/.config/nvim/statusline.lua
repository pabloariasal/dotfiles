vim.o.statusline = '%F'
vim.opt.statusline:append '%m' -- modified
vim.opt.statusline:append '%r' -- read only tag
vim.opt.statusline:append '%h' -- help tag
vim.opt.statusline:append '%q' -- quickfixlist tag
vim.opt.statusline:append '%w' -- preview window tag
vim.opt.statusline:append '%=' -- separation point
vim.opt.statusline:append '%y ' -- type of file
vim.opt.statusline:append '[%{&fileencoding?&fileencoding:&encoding}] '
vim.opt.statusline:append '[col %c] '
vim.opt.statusline:append '[%l/%L %p%%] '
