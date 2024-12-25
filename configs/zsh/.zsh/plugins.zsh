zstyle ':antidote:bundle' use-friendly-names 'yes'

# Clone antidote if necessary.
if [[ ! -d ${HOME}/.antidote ]]; then
  git clone https://github.com/mattmc3/antidote ${HOME}/.antidote
fi

source ${HOME}/.antidote/antidote.zsh
antidote load "${HOME}/.zsh/zsh_plugins.txt" "${HOME}/.zsh_plugins.zsh"

# some Oh-my-zsh plugins expect this to be set
ZSH_CACHE_DIR="${HOME}/.cache"
