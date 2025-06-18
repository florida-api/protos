#!/bin/bash

set -e

if [ ! -d gen/cpp ]; then
  echo "❌ C++ code not found. Please run scripts/generate-cpp.sh first."
  exit 1
fi

echo "✅ C++ code is ready in gen/cpp/. No further setup required." 
