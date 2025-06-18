#!/bin/bash

set -e

if [ ! -d gen/ts ]; then
  echo "❌ TypeScript code not found. Please run scripts/generate-ts.sh first."
  exit 1
fi

cd gen/ts

# Initialize npm package if package.json doesn't exist
if [ ! -f package.json ]; then
  echo "📦 Initializing npm package..."
  npm init -y
  
  # Update package.json with proper configuration
  echo "📝 Updating package.json..."
  cat > package.json << 'EOF'
{
  "name": "florida-api-protos",
  "version": "0.1.0",
  "description": "Generated Protocol Buffer code for Florida API",
  "main": "index.js",
  "types": "index.d.ts",
  "scripts": {
    "build": "tsc",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": ["protobuf", "grpc", "florida", "api"],
  "author": "",
  "license": "MIT",
  "dependencies": {
    "google-protobuf": "^3.21.0",
    "grpc-web": "^1.4.0"
  },
  "devDependencies": {
    "@types/google-protobuf": "^3.15.0",
    "typescript": "^5.0.0"
  }
}
EOF
fi

# Create tsconfig.json if it doesn't exist
if [ ! -f tsconfig.json ]; then
  echo "📝 Creating tsconfig.json..."
  cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "commonjs",
    "lib": ["ES2020"],
    "declaration": true,
    "outDir": "./dist",
    "rootDir": "./",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true
  },
  "include": [
    "**/*.ts"
  ],
  "exclude": [
    "node_modules",
    "dist"
  ]
}
EOF
fi

# Create a basic README for the TypeScript module
if [ ! -f README.md ]; then
  echo "📝 Creating README.md..."
  cat > README.md << 'EOF'
# Florida API Protos - TypeScript

This package contains the TypeScript code generated from Protocol Buffer definitions.

## Usage

```typescript
import { FloridaProperty, Geometry } from 'florida-api-protos';

const property: FloridaProperty = {
  id: "12345",
  type: "Feature",
  geometry: {
    coordinates: [1.0, 2.0],
    type: "Point"
  }
};
```

## Dependencies

- `google-protobuf` - Protocol Buffers runtime
- `grpc-web` - gRPC-Web support
EOF
fi

echo "🚀 Running npm install..."
npm install
echo "✅ TypeScript setup complete."
