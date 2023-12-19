# create temporary dirs and files
function tmp()
{
  if [[ -z "$1" ]]; then
    nvim $(mktemp)
  else
    nvim $(mktemp --suffix ."$1")
  fi
}

# link compile_comands.json
function lcc() {
  local compilation_database="$(fd --no-ignore compile_commands.json)"
  if [[ -z "$compilation_database" ]]; then
    echo "no compilation database found"
    return 0
  fi
  ln -s -v "$compilation_database" .
}

function reveal_present()
{
  ${CHROMIUM_EXEC} "$1" index.html
}
