#!/bin/bash
if [ ! -z "$1" ]; then
    if [[ "$1" == "work" ]] || [[ "$1" == "personal" ]]; then
        dirs=$(find . -maxdepth 1 -type d -printf '%f\n')
        for dir in $dirs; do
            # Ignore hidden files and directories
            if [[ $dir != \.* ]]; then
                if [[ "$1" == "work" ]] && [[ $dir == *work ]]; then
                    stow -R -v "$dir"
                elif [[ "$1" == "personal" ]] && [[ $dir == *personal ]]; then
                    stow -R -v "$dir"
                elif [[ $dir != *work ]] && [[ $dir != *personal ]]; then
                    stow -R -v "$dir"
                fi
            fi
        done
    else
        echo "Argument must be one of either \"work\" or \"personal\""
    fi
else
    echo "No argument supplied; must be one of either \"work\" or \"personal\""
fi
