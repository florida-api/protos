#!/bin/bash

set -e

if [ ! -d gen/php ]; then
  echo "❌ PHP code not found. Please run scripts/generate-php.sh first."
  exit 1
fi

echo "✅ PHP code is ready in gen/php/. No further setup required." 
