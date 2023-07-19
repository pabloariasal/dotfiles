-- removes trailing white space
vim.api.nvim_create_user_command('ClearWhitespace', '%s/\\s\\+$//', {})
-- close all buffers
vim.api.nvim_create_user_command('BuffCloseAll', 'bufdo bwipeout', {})
-- close all buffers but the current one (similar to tabonly)
vim.api.nvim_create_user_command('BuffOnly', '%bd|e#', {})
-- turn on spell checking in german
vim.api.nvim_create_user_command('SpellCheckGerman', 'set spell spelllang=de_de', {})
-- turn on spell checking in englisch
vim.api.nvim_create_user_command('SpellCheckEnglish', 'set spell spelllang=en_us', {})
-- open a tip like clippy
function Vtip()
  vim.api.nvim_echo({{vim.fn.system('curl -s ' .. "https://vtip.43z.one")}}, true, {})
end
vim.api.nvim_create_user_command('Vtip', Vtip, {})
-- list snippets of current filetype
vim.api.nvim_create_user_command('PrintSnippets', function() vim.cmd('!list_snippets ' .. vim.bo.filetype) end, {})
-- Read template
--
function getCurrentYear()
    local currentTime = os.time()
    return tonumber(os.date("%Y", currentTime))
end

vim.api.nvim_create_user_command('Template', function(opts)
  vim.cmd('read ' .. opts.fargs[1])
  local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
 if string.match(first_line, '^%s*$') then
    vim.cmd('0d')
  end
  vim.cmd('%s/%YEAR%/' .. getCurrentYear() .. '/g')
end,
  { nargs = 1,
    complete = function(ArgLead, CmdLine, CursorPos)
      return vim.split(vim.fn.glob('~/.config/nvim/templates/*'), '\n')
    end,})
