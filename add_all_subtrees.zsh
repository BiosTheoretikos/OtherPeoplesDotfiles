#!/usr/bin/env zsh

while read name url
do
	./add_subtree.zsh $url $name
done < remotes.txt
