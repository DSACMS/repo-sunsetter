#!/bin/bash

CODE_JSON_PATH="${1:-code.json}"

echo "🔍 Fetching maturity tier from $CODE_JSON_PATH..."

# Install jq if not already installed
if ! command -v jq &> /dev/null; then
    echo "Installing jq..."
    sudo apt-get update && sudo apt-get install -y jq
fi

# Check for file existence
if [ ! -f "$CODE_JSON_PATH" ]; then
  echo "❌ File not found: $CODE_JSON_PATH"
  exit 1
fi

# Validate JSON format
if ! jq empty "$CODE_JSON_PATH" 2>/dev/null; then
  echo "❌ Invalid JSON in $CODE_JSON_PATH"
  exit 1
fi

# Extract values from JSON
TIER=$(jq -r '.maturityModelTier // "unknown"' "$CODE_JSON_PATH")

if [ "$TIER" == "null" ] || [ "$TIER" == "unknown" ]; then
  echo "❌ maturityModelTier not found in $CODE_JSON_PATH"
  exit 1
fi

echo "TIER=$TIER" >> $GITHUB_ENV
echo "✅ Maturity Model Tier: $TIER"