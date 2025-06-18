#!/bin/bash

set -e

echo "🚀 Generating Ruby code..."

if ! command -v buf &> /dev/null; then
    echo "❌ Error: buf CLI is not installed"
    exit 1
fi

buf generate --template protos/templates/buf.gen.ruby.yaml

echo "✅ Ruby code generated in gen/ruby/" 
