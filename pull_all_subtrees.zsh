#!/usr/bin/env zsh

while read url name
do
	./pull_subtree.zsh $url $name
done < subtrees.txt
