#!/usr/bin/env bash

input="time"
PAIR="eng-kir"
POSes="n|vblex|adj|adv|vbser|vbdo|vbhaver|ij"

morphs=$(echo "$input" | lt-proc $PAIR.automorf.bin | cg-conv -Ca | grep -v "\"<.*>\"" )

IFS=$'\n'
for morph in $morphs; do
	#echo $morph
	tags=$(echo $morph | sed "s/\".*\"//" | sed 's/ /\n/g' )
	outtags=""
	for tag in $tags; do
		if [[ "$tag" =~ ^($POSes)$ ]]; then
			echo $tag;
		fi;
	done;
done;

#lt-print -H eng-kir.autobil.bin | hfst-txt2fst -o /tmp/dix.hfst

#echo "look" | sed -r 's/(.)/\1 /g' | sed 's/$/\?\*/' | hfst-regexp2fst -S -o /tmp/see.prefix
##hfst-txt2fst .deps/kir-eng.autobil.att | hfst-invert -o /tmp/dix.hfst
#hfst-compose-intersect -2 /tmp/dix.hfst -1 /tmp/see.prefix  | hfst-fst2strings

# https://wiki.apertium.org/wiki/Extracting_strings_with_a_prefix_in_HFST
