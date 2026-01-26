#!/bin/bash

# Get tier from environment variable
TIER="${TIER:-0}"

FILE_URL=""
DESTINATION_PATH="temp_checklist.md"

if [ "$TIER" == "0" ] || [ "$TIER" == "1" ]; then
    FILE_URL="https://raw.githubusercontent.com/DSACMS/repo-sunsetter/main/checklists/BASIC_ARCHIVAL_CHECKLIST.md"
elif [ "$TIER" == "2" ] || [ "$TIER" == "3" ] || [ "$TIER" == "4" ]; then
    FILE_URL="https://raw.githubusercontent.com/DSACMS/repo-sunsetter/main/checklists/COMPREHENSIVE_ARCHIVAL_CHECKLIST.md"
 else
    echo "❌ Unknown tier: $TIER"
    exit 1
fi

# Download file
    echo "📥 Downloading file from $FILE_URL..."
    wget -q --show-progress -O "$DESTINATION_PATH" "$FILE_URL"

    # Verify download
    if [ -f "$DESTINATION_PATH" ]; then
        echo "✅ File downloaded successfully"
        ls -lh "$DESTINATION_PATH"
    else
        echo "❌ Download failed"
        exit 1
    fi