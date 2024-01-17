function debug_nvim_core() {
  rm -f ~/.cache/nvim/debug-server.pipe
  VIMRUNTIME=./runtime gdb --args ./build/bin/nvim --clean --headless --listen ~/.cache/nvim/debug-server.pipe "$@"
}

function debug_nvim_tui() {
  VIMRUNTIME=./runtime ./build/bin/nvim --clean --remote-ui --server ~/.cache/nvim/debug-server.pipe "$@"
}

function run_local_nvim() {
  make &&
  VIMRUNTIME=./runtime ./build/bin/nvim --luamod-dev --clean "$@"
}
