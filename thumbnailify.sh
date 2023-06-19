#!/bin/bash
set -euo pipefail

select_first_file() {
    for arg in "$@"; do
        if [ -e "$arg" ] && [[ "$arg" != ".folder."* ]]; then
            echo "$arg"
            return
        fi
    done
}

for dir in "$@"; do
    # check if arg is valid, or skip
    if [ ! -d "$dir" ]; then continue; fi
    # check if directory has thumbnail, or skip
    existing_thumb=$(echo "$dir"/.folder.*)
    if [ "$existing_thumb" != "$dir"/".folder.*" ]; then continue; fi
    # candidate directory found, now find a file
    target=""
    for try in "$dir"/{cover,Cover}.{jpg,png,webp} "$dir"/{front,Front}.{jpg,png,webp} "$dir"/{folder,Folder}.{jpg,png,webp} "$dir"/01.{jpg,png,webp} "$dir"/001.{jpg,png,webp}; do
        if [ -e "$try" ]; then
            target="$try"
            break
        fi
    done
    if [ -z "$target" ] && [ ${THUMBNAIL_AUTOSELECT_ANY-1} = 1 ]; then
        target=$(select_first_file "$dir"/*.{jpg,webp,png})
    fi
    if [ ! -z "$target" ]; then
        pushd "$dir" >/dev/null
        ext=${target##*.}
        ln -s "$(basename "$target")" .folder."$ext"
        echo "Thumbnailed ${dir}!"
        popd >/dev/null
    fi
done
