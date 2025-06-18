#!/bin/bash

set -e

echo "🚀 Generating Rust code..."

if ! command -v buf &> /dev/null; then
    echo "❌ Error: buf CLI is not installed"
    exit 1
fi

buf generate --template protos/templates/buf.gen.rust.yaml

echo "✅ Rust code generated in gen/rust/"
