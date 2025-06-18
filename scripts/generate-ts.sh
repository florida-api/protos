#!/bin/bash

set -e

echo "🚀 Generating TypeScript code..."

if ! command -v buf &> /dev/null; then
    echo "❌ Error: buf CLI is not installed"
    exit 1
fi

buf generate --template protos/templates/buf.gen.ts.yaml

echo "✅ TypeScript code generated in gen/ts/"
