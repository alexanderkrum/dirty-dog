#!/usr/local/bin/bash
for line in $(cat requirements.txt)
do
command -v $line >/dev/null 2>&1 || { echo >&2 "I require $line but it's not installed.";}
done