#!/bin/bash

set -e

echo "🚀 Generating PHP code..."

if ! command -v buf &> /dev/null; then
    echo "❌ Error: buf CLI is not installed"
    exit 1
fi

buf generate --template protos/templates/buf.gen.php.yaml

echo "✅ PHP code generated in gen/php/" 
