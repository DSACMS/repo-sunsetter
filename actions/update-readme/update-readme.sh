#!/bin/bash

ARCHIVE_TEXT="> [!WARNING]\n> This project is now archived and no longer actively maintained. It has been archived to retain its contents for reference. Feel free to explore and fork the repository, but please note that updates or support will not be provided."

awk -v notice="$ARCHIVE_TEXT" '
    /^# / && !found {
    print $0
    print notice
    found=1
    next
}
{print}' README.md > temp_readme.md
mv temp_readme.md README.md