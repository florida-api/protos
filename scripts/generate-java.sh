#!/bin/bash

set -e

echo "🚀 Generating Java code..."

if ! command -v buf &> /dev/null; then
    echo "❌ Error: buf CLI is not installed"
    exit 1
fi

buf generate --template protos/templates/buf.gen.java.yaml

echo "✅ Java code generated in gen/java/" 
