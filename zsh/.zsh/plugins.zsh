zstyle ':antidote:bundle' use-friendly-names 'yes'

# clone antidote if necessary and generate a static plugin file (zsh_plugins.zsh)
plugins_file="${HOME}/.zsh/zsh_plugins.txt"
zhome=${ZDOTDIR:-$HOME}

if [[ ! $zhome/.zsh_plugins.zsh -nt $plugins_file ]]; then
  [[ -e $zhome/.antidote ]] \
    || git clone --depth=1 https://github.com/mattmc3/antidote.git $zhome/.antidote
  [[ -e $plugins_file ]] || touch $plugins_file
  (
    source $zhome/.antidote/antidote.zsh
    antidote bundle <$plugins_file >$zhome/.zsh_plugins.zsh
  )
fi

# uncomment if you want your session to have commands like `antidote update`
autoload -Uz $zhome/.antidote/functions/antidote

# source static plugins file
source $zhome/.zsh_plugins.zsh

unset zhome
unset plugins_file
