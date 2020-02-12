
# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
bindkey -s "\C-f" "\C-a hstr --favorites \C-j"
export HSTR_CONFIG=hicolor,blacklist,raw-history-view,static-favorites

