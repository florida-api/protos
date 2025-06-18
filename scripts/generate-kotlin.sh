#!/bin/bash

set -e

echo "🚀 Generating Kotlin code..."

if ! command -v buf &> /dev/null; then
    echo "❌ Error: buf CLI is not installed"
    exit 1
fi

buf generate --template protos/templates/buf.gen.kotlin.yaml

echo "✅ Kotlin code generated in gen/kotlin/" 
