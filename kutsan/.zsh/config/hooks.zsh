# Register hook functions.
add-zsh-hook preexec _preexec_fasd

# Register fasd to track most used files and directories.
function _preexec_fasd() {
	if (( $+commands[fasd] )) {
		fasd --proc $(fasd --sanitize "$1") &>/dev/null
	}
}

# Create symbolic links for neovim and vim configs.
if ! [[ -L ~/.vim/vimrc ]] {
	ln -s ~/.vim/init.vim ~/.vim/vimrc
}
if ! [[ -L ~/.config/nvim ]] {
	ln -s ~/.vim ~/.config/nvim
}

# Create symbolic link for prompt theme if it's not already linked.
if ! [[ -L $ZDOTDIR/autoload/prompt_pure_setup ]] {
	ln -s $ZDOTDIR/plugins/pure/pure.zsh $ZDOTDIR/autoload/prompt_pure_setup
}
if ! [[ -L $ZDOTDIR/autoload/async ]] {
	ln -s $ZDOTDIR/plugins/pure/async.zsh $ZDOTDIR/autoload/async
}

# Recompile prompt files if it's needed.
zrecompile -p \
	-M $ZDOTDIR/autoload/async -- \
	-M $ZDOTDIR/autoload/prompt_pure_setup
