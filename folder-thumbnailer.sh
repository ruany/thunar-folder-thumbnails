#!/bin/bash

if [ -f "$2/.folder.jpg" ]; then
	convert -thumbnail "$1" "$2/.folder.jpg" "$3" 1>/dev/null 2>&1
elif [ -f "$2/.folder.webp" ]; then
	convert -thumbnail "$1" "$2/.folder.webp" "$3" 1>/dev/null 2>&1
elif [ -f "$2/.folder.png" ]; then
	convert -thumbnail "$1" "$2/.folder.png" "$3" 1>/dev/null 2>&1
else
    file=$(echo -n "$4" | md5sum | cut -d " " -f1).png
	rm -f "$XDG_CACHE_HOME/thumbnails/normal/$file" || \
	rm -f "$XDG_CACHE_HOME/thumbnails/large/$file"
fi
