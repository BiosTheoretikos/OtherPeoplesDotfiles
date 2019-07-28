export DOTFILES="$HOME/.dotfiles"

# Antibody
DISABLE_AUTO_UPDATE=true
export ZSH="$HOME/Library/Caches/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source $DOTFILES/zsh_plugins.sh

# Theme
export MNML_INSERT_CHAR="$"
export MNML_PROMPT=(mnml_git mnml_keymap)
export MNML_RPROMPT=('mnml_cwd 20')

# Dotfiles
source $DOTFILES/path.zsh
source $DOTFILES/aliases.zsh
