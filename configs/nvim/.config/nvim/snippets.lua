local status_ok, snippy = pcall(require, "snippy")
if not status_ok then
  return
end

snippy.setup {
    scopes = {
        cpp = {'_', 'cpp', 'gtest'},
   }
}
