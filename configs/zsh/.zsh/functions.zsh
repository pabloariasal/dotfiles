# create temporary dirs and files
function tmp()
{
  if [[ -z "$1" ]]; then
    nvim $(mktemp)
  else
    nvim $(mktemp --suffix ."$1")
  fi
}

function reveal_present()
{
  ${CHROMIUM_EXEC} "$1" index.html
}
