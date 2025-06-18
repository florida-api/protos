#!/bin/bash

set -e

if [ ! -d gen/ruby ]; then
  echo "❌ Ruby code not found. Please run scripts/generate-ruby.sh first."
  exit 1
fi

echo "✅ Ruby code is ready in gen/ruby/. No further setup required." 
