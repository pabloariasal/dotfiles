# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# For GNU ls, we use the default ls color theme. They can later be overwritten by themes.
if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi

source ~/.zsh/plugins.zsh
source ~/.zsh/fzf.zsh
source ~/.zsh/history.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/directories.zsh
source ~/.zsh/git.zsh
source ~/.zsh/bindings.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/archives.zsh
source ~/.zsh/neovim_development.zsh


# initialize haskell environment
[ -f "${HOME}/.ghcup/env" ] && source "${HOME}/.ghcup/env"

# initialize rust environment
[ -f "${HOME}/.cargo/env" ] && source "${HOME}/.cargo/env"

if [ -n "$GREET" ]; then
  neofetch
  cal -m -n 2 --color=always
  figlet "Welcome!"
  return 0
fi

# Expand aliases with TAB
zstyle ':completion:*' completer _expand_alias _complete _ignored

if [ -z "$NO_LWD" ]; then
  # switch to last visited directory
  lwd
fi

# Prompt
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# prompt looks for themes installed in directories under fpath
# themes are zsh functions with the name prompt_<theme>_setup
# powerlevel10k installs a files called prompt_powerlevel10k_setup
# that file sources powerlevel10k.zsh-theme
autoload -Uz promptinit && promptinit && prompt powerlevel10k
