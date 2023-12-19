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

##########################
# Archives

function extract() {
  if [[ "$1" == *".tar.gz"* ]]; then
    tar -xvzf "$1"
  elif [[ "$1" == *".tar"* ]]; then
    tar -xvf "$1"
  elif [[ "$1" == *".zip"* ]]; then
    unzip "$1"
  else
    echo "unknown format"
    return 1
  fi
}

function extract_to_dir() {
   if [ ! "$#" -eq 2 ]; then
        echo "Expected two arguments"
        echo "usage: extract_to_dir <archive> <dir>"
        return 1
  fi
  if [[ "$1" == *".tar.gz"* ]]; then
    mkdir -p "$2"
    tar -xvzf "$1" -C "$2"
  elif [[ "$1" == *".tar"* ]]; then
    tar -xvf "$1" -C "$2"
  elif [[ "$1" == *".zip"* ]]; then
    unzip -d "$2" "$1"
  else
    echo "unknown format"
    return 1
  fi
}

function list_archive() {
  if [[ "$1" == *".tar.gz"* ]]; then
    tar -tvzf "$1"
  elif [[ "$1" == *".tar"* ]]; then
    tar -tvf "$1"
  elif [[ "$1" == *".zip"* ]]; then
    unzip -l "$1"
  else
    echo "unknown format"
    return 1
  fi
}
