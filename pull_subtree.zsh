#!/usr/bin/env zsh

# unsetopt EXEC
# setopt XTRACE
# typeset debug=1

typeset remote_url=$1
typeset subtree_name=${2:-${${remote_url##*\/}%.git}}

if [[ -v debug ]]
then
	echo Remote URL: ${remote_url}
	echo Submodule: ${subtree_name}
	exit 0
fi

git subtree pull --squash --prefix=${subtree_name} ${remote_url} master
