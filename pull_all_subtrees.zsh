#!/usr/bin/env zsh

while read name url
do
	./pull_subtree.zsh $url $name
done < subtrees.txt
