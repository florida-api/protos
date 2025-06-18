#!/bin/bash

set -e

if [ ! -d gen/go ]; then
  echo "❌ Go code not found. Please run scripts/generate-go.sh first."
  exit 1
fi

cd gen/go

# Initialize Go module if go.mod doesn't exist
if [ ! -f go.mod ]; then
  echo "📦 Initializing Go module..."
  go mod init github.com/florida-api/protos/gen/go
  
  # Add dependencies
  echo "📝 Adding dependencies..."
  go get google.golang.org/grpc@v1.59.0
  go get google.golang.org/protobuf@v1.31.0
  go get github.com/golang/protobuf@v1.5.3
fi

# Create a basic README for the Go module
if [ ! -f README.md ]; then
  echo "📝 Creating README.md..."
  cat > README.md << 'EOF'
# Florida API Protos - Go

This module contains the Go code generated from Protocol Buffer definitions.

## Usage

```go
import (
    "github.com/florida-api/protos/gen/go/properties/v1"
)

func main() {
    property := &v1.FloridaProperty{
        Id: "12345",
        Type: "Feature",
    }
}
```

## Dependencies

- `google.golang.org/grpc` - gRPC support
- `google.golang.org/protobuf` - Protocol Buffers runtime
EOF
fi

echo "🚀 Running go mod tidy..."
go mod tidy
echo "✅ Go module setup complete."
