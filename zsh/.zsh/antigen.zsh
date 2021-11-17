source ${HOME}/.antigen.zsh

# some Oh-my-zsh plugins expect this to be set
ZSH_CACHE_DIR="${HOME}/.cache"
antigen bundle ohmyzsh/ohmyzsh plugins/extract
antigen bundle ael-code/zsh-colored-man-pages
antigen bundle ohmyzsh/ohmyzsh plugins/dircycle
antigen bundle ohmyzsh/ohmyzsh plugins/last-working-dir
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle pabloariasal/zfm

# Load the theme.
antigen theme romkatv/powerlevel10k

antigen apply
