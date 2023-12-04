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
-- list snippets of current filetype
vim.api.nvim_create_user_command('ListSnippets', function(opts)
  if #opts.fargs == 0 then
    vim.cmd('!list_snippets ' .. vim.bo.filetype)
  else
    vim.cmd('!list_snippets ' .. opts.fargs[1])
  end
end, { nargs='?'})
-- Read template
function getCurrentYear()
    local currentTime = os.time()
    return tonumber(os.date("%Y", currentTime))
end

vim.api.nvim_create_user_command('Template', function(opts)
    -- read provided template file into buffer
    vim.cmd('read ' .. opts.fargs[1])
    -- remove the first line if empty
    local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
     if string.match(first_line, '^%s*$') then
      vim.cmd('0d')
    end
    -- replace all ocurrences of '%YEAR%' with the current year
    vim.cmd('silent! %s/%YEAR%/' .. getCurrentYear() .. '/g')
    -- vim.cmd('w')
  end,
  { nargs = 1,
    complete = function(ArgLead, CmdLine, CursorPos)
      return vim.split(vim.fn.glob('~/.config/nvim/templates/*'), '\n')
    end,})
