#!/bin/bash

# Florida API Protos - Setup All Languages
# Usage: ./scripts/setup-all.sh [language]
# If no language is specified, setup all languages

set -e

LANGUAGES=("go" "rust" "ts" "python" "java" "kotlin" "cpp" "csharp" "ruby" "php")

if [ $# -eq 0 ]; then
    echo "🚀 Setting up all languages..."
    for lang in "${LANGUAGES[@]}"; do
        if [ -d "gen/$lang" ]; then
            echo "📦 Setting up $lang..."
            ./scripts/setup-$lang.sh
            echo ""
        else
            echo "⚠️  Skipping $lang (no generated code found)"
        fi
    done
    echo "✅ All languages setup complete!"
else
    LANG=$1
    if [[ " ${LANGUAGES[@]} " =~ " ${LANG} " ]]; then
        if [ -d "gen/$LANG" ]; then
            echo "📦 Setting up $LANG..."
            ./scripts/setup-$LANG.sh
        else
            echo "❌ $LANG code not found. Please run scripts/generate-$LANG.sh first."
            exit 1
        fi
    else
        echo "❌ Unknown language: $LANG"
        echo "Supported languages: ${LANGUAGES[*]}"
        exit 1
    fi
fi 
