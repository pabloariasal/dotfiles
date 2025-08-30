# create temporary dirs and files
function tmp()
{
  if [[ -z "$1" ]]; then
    nvim $(mktemp)
  else
    if [[ $OSTYPE == 'darwin'* ]]; then
      nvim $(mktemp $TMPDIR/$(uuidgen)."$1")
    else
      nvim $(mktemp --suffix ."$1")
    fi
  fi
}

function py() {
    python3 -c "from math import *; print($*)"
}

# Make CTRL-Z background things and unbackground them.
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

function ensure_dots_dir() {
  if [ "$(pwd)" != "$DOTFILES" ]; then
    echo "Error: must be in $DOTFILES directory!"
    return 1
  fi
  return 0
}

function nvim-help() {
  nvim +"help $1" +'only'
}

##########################
# reveal

function reveal_present()
{
  ${CHROMIUM_EXEC} "$1" index.html
}
