#!/bin/bash

set -e

if [ ! -d gen/csharp ]; then
  echo "❌ C# code not found. Please run scripts/generate-csharp.sh first."
  exit 1
fi

echo "✅ C# code is ready in gen/csharp/. No further setup required." 
