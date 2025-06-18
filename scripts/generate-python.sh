#!/bin/bash

set -e

echo "🚀 Generating Python code..."

if ! command -v buf &> /dev/null; then
    echo "❌ Error: buf CLI is not installed"
    exit 1
fi

buf generate --template protos/templates/buf.gen.python.yaml

echo "✅ Python code generated in gen/python/" 
