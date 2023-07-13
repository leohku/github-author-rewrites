#!/bin/bash

username=""

for SUBDIR in *; do
  if [ -d "$SUBDIR" ]; then
    cd "$SUBDIR" || exit 1
    folder_name=$(basename "$SUBDIR")
    echo "[INFO] Now executing $folder_name"
    git filter-repo --mailmap ../mailmap --force
    git remote rm origin
    git remote add origin git@github.com:$username/$folder_name.git
    git push --all origin -f
    cd - >/dev/null  # Return to the previous directory
  fi
done
