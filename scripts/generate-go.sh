#!/bin/bash

set -e

echo "🚀 Generating Go code..."

if ! command -v buf &> /dev/null; then
    echo "❌ Error: buf CLI is not installed"
    exit 1
fi

buf generate --template protos/templates/buf.gen.go.yaml

echo "✅ Go code generated in gen/go/"
