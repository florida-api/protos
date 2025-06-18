#!/bin/bash

# Florida API Protos - Generate All Languages
# This script generates code for all supported languages

set -e

echo "🚀 Generating Protocol Buffer code for all languages..."

# Check if buf is installed
if ! command -v buf &> /dev/null; then
    echo "❌ Error: buf CLI is not installed"
    echo "Please install buf from: https://buf.build/docs/installation"
    exit 1
fi

# Generate code for all languages
echo "📦 Generating code..."
buf generate --template protos/buf.gen.yaml

echo "✅ Code generation completed!"
echo ""
echo "📁 Generated code is available in the 'gen/' directory:"
echo "  - Go: gen/go/"
echo "  - TypeScript: gen/ts/"
echo "  - Python: gen/python/"
echo "  - Rust: gen/rust/"
echo "  - Java: gen/java/"
echo "  - Kotlin: gen/kotlin/"
echo "  - C++: gen/cpp/"
echo "  - C#: gen/csharp/"
echo "  - Ruby: gen/ruby/"
echo "  - PHP: gen/php/"
echo ""
echo "🔧 Next steps:"
echo "  - Run 'scripts/setup-go.sh' to setup Go module"
echo "  - Run 'scripts/setup-rust.sh' to setup Rust crate"
echo "  - Run 'scripts/setup-ts.sh' to setup TypeScript"
echo "  - Run 'scripts/setup-python.sh' to setup Python"
