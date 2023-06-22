function Vtip()
  vim.api.nvim_echo({{vim.fn.system('curl -s ' .. "https://vtip.43z.one")}}, true, {})
end
vim.api.nvim_create_user_command('Vtip', Vtip, {})
