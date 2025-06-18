#!/bin/bash

set -e

if [ ! -d gen/rust ]; then
  echo "❌ Rust code not found. Please run scripts/generate-rust.sh first."
  exit 1
fi

cd gen/rust

# Initialize a new Rust crate if Cargo.toml doesn't exist
if [ ! -f Cargo.toml ]; then
  echo "📦 Initializing new Rust crate..."
  cargo init --lib --name florida-api-protos
  
  # Update Cargo.toml with proper dependencies
  echo "📝 Updating Cargo.toml with dependencies..."
  cat > Cargo.toml << 'EOF'
[package]
name = "florida-api-protos"
version = "0.1.0"
edition = "2021"
description = "Generated Protocol Buffer code for Florida API"
license = "MIT"
repository = "https://github.com/florida-api/protos"
keywords = ["protobuf", "grpc", "florida", "api"]
categories = ["api-bindings"]

[dependencies]
prost = "0.12"
tonic = "0.10"
bytes = "1.0"

[dev-dependencies]
tokio = { version = "1.0", features = ["full"] }

[build-dependencies]
tonic-build = "0.10"
EOF
fi

# Create lib.rs with proper module structure
echo "📝 Setting up lib.rs..."
cat > src/lib.rs << 'EOF'
//! Florida API Protocol Buffer definitions
//! 
//! This crate contains generated Protocol Buffer code for the Florida API.

// Include the generated code directly
include!("../properties.v1.rs");
EOF

# Remove build.rs if it exists
if [ -f build.rs ]; then
  echo "🗑️ Removing build.rs (not needed for pre-generated code)..."
  rm build.rs
fi

echo "🚀 Running cargo check..."
cargo check
echo "✅ Rust crate setup complete."
