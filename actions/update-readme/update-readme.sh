#!/bin/bash

ARCHIVE_TEXT="> [!WARNING]\n>$ARCHIVE_NOTICE_TEXT"

awk -v notice="$ARCHIVE_TEXT" '
    /^# / && !found {
    print $0
    print notice
    found=1
    next
}
{print}' README.md > temp_readme.md
mv temp_readme.md README.md