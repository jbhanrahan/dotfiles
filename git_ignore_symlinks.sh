#!/bin/bash

for f in $(git status --porcelain | grep '^??' | sed 's/^?? //'); do
    test -L "$f" && echo $f >> .gitignore;
    test -d "$f" && echo $f\* >> .gitignore;
done
