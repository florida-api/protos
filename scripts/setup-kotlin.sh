#!/bin/bash

set -e

if [ ! -d gen/kotlin ]; then
  echo "❌ Kotlin code not found. Please run scripts/generate-kotlin.sh first."
  exit 1
fi

echo "✅ Kotlin code is ready in gen/kotlin/. No further setup required." 
