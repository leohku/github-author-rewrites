#!/bin/bash

username=""

while IFS= read -r line; do
    echo "Cloning: $username/$line.git"
    git clone git@github.com:$username/$line.git
done < "repos.txt"
