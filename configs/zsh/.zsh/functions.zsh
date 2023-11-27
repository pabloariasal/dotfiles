# create temporary dirs and files
function tmp()
{
  if [[ -z "$1" ]]; then
    nvim $(mktemp)
  else
    nvim $(mktemp --suffix ."$1")
  fi
}

# Toggle ctags file
function toggle_ctags()
{
  local file='.ctagsenable'
  if [[ -f $file ]]; then
    rm $file && echo "ctags disabled"
  else
    echo "fd -tf --strip-cwd-prefix" > $file && echo "ctags enabled"
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

function reveal_new_presentation()
{
  wget https://github.com/hakimel/reveal.js/archive/master.zip
  unzip -o master.zip
  cp -r reveal.js-master/* .
  cp index.html index.html.orig
  rm -rf reveal.js-master
  rm master.zip
}

function reveal_present()
{
  ${CHROMIUM_EXEC} "$1" index.html
}
