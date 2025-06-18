#!/bin/bash

set -e

if [ ! -d gen/java ]; then
  echo "❌ Java code not found. Please run scripts/generate-java.sh first."
  exit 1
fi

echo "✅ Java code is ready in gen/java/. No further setup required." 
