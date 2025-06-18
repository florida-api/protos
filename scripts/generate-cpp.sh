#!/bin/bash

set -e

echo "🚀 Generating C++ code..."

if ! command -v buf &> /dev/null; then
    echo "❌ Error: buf CLI is not installed"
    exit 1
fi

buf generate --template protos/templates/buf.gen.cpp.yaml

echo "✅ C++ code generated in gen/cpp/" 
