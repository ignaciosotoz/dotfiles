#!/bin/bash

DIRS="`/bin/ls --color=auto -l $@ | grep ^d`"
FILES="`/bin/ls --color=auto -l $@ | grep ^\-`"

if [ "$DIRS" ]
then
    echo "DIRECTORIES"
    echo -e "$DIRS\

"
fi

if [ "$FILES" ]
then
    echo "FILES"
    echo "$FILES\

"
fi
