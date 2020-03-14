source ${HOME}/.antigen.zsh

antigen bundle ohmyzsh/ohmyzsh plugins/extract
antigen bundle ohmyzsh/ohmyzsh plugins/colored-man-pages
antigen bundle ohmyzsh/ohmyzsh plugins/dircycle
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme romkatv/powerlevel10k

antigen apply
