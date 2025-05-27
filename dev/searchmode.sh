#!/usr/bin/env bash

lt-print -H eng-kir.autobil.bin | hfst-txt2fst -o /tmp/dix.hfst

echo "look" | sed -r 's/(.)/\1 /g' | sed 's/$/\?\*/' | hfst-regexp2fst -S -o /tmp/see.prefix
#hfst-txt2fst .deps/kir-eng.autobil.att | hfst-invert -o /tmp/dix.hfst
hfst-compose-intersect -2 /tmp/dix.hfst -1 /tmp/see.prefix  | hfst-fst2strings

# https://wiki.apertium.org/wiki/Extracting_strings_with_a_prefix_in_HFST
