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

echo "${subtree_name}\t${remote_url}" >> subtrees.txt \
	&& git add subtrees.txt \
	&& git commit -m "Added ${subtree_name} subtree." \
	&& git subtree add --squash --prefix=${subtree_name} ${remote_url} master
