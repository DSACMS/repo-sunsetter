#!/bin/bash

awk -v notice="$ARCHIVE_NOTICE_TEXT" '
    /^# / && !found {
    print $0
    print notice
    found=1
    next
}
{print}' README.md > temp_readme.md
mv temp_readme.md README.md