#!/bin/bash

clean_dir() {
	CLEANING_PATH="$1"
	for filename in $CLEANING_PATH/*.md; do
		vi -c ":set nobomb" -c ":wq" $filename
	done	
}

[ -d "$1" ] && clean_dir "$1" || echo $'\n * Usage:\n  ./bin/bomb_clean.sh ./path/to/files/\n'

