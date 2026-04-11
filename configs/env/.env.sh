export DOTFILES="${HOME}/dotfiles"
export EDITOR="nvim"
export VISUAL="nvim"
export PATH="${HOME}/.local/bin:$PATH"

# Tells SSH clients where to find the SSH agent — it contains the path to a Unix domain socket file that the agent is listening on.
# on Arch, this must be set explicitly
if [ -f /etc/os-release ] && grep -q '^ID=arch$' /etc/os-release; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi
