#!/bin/bash

set -e

if [ ! -d gen/python ]; then
  echo "❌ Python code not found. Please run scripts/generate-python.sh first."
  exit 1
fi

cd gen/python

# Create requirements.txt if it doesn't exist
if [ ! -f requirements.txt ]; then
  echo "📝 Creating requirements.txt..."
  cat > requirements.txt << 'EOF'
protobuf>=4.21.0
grpcio>=1.59.0
grpcio-tools>=1.59.0
EOF
fi

# Create setup.py if it doesn't exist
if [ ! -f setup.py ]; then
  echo "📝 Creating setup.py..."
  cat > setup.py << 'EOF'
from setuptools import setup, find_packages

setup(
    name="florida-api-protos",
    version="0.1.0",
    description="Generated Protocol Buffer code for Florida API",
    author="",
    author_email="",
    packages=find_packages(),
    install_requires=[
        "protobuf>=4.21.0",
        "grpcio>=1.59.0",
        "grpcio-tools>=1.59.0",
    ],
    python_requires=">=3.8",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
    ],
)
EOF
fi

# Create __init__.py files for proper Python package structure
if [ ! -f __init__.py ]; then
  echo "📝 Creating __init__.py..."
  cat > __init__.py << 'EOF'
"""
Florida API Protocol Buffer definitions

This package contains generated Protocol Buffer code for the Florida API.
"""

__version__ = "0.1.0"
EOF
fi

# Create a basic README for the Python module
if [ ! -f README.md ]; then
  echo "📝 Creating README.md..."
  cat > README.md << 'EOF'
# Florida API Protos - Python

This package contains the Python code generated from Protocol Buffer definitions.

## Installation

```bash
pip install -r requirements.txt
```

## Usage

```python
from properties import properties_pb2

property = properties_pb2.FloridaProperty(
    id="12345",
    type="Feature"
)
```

## Dependencies

- `protobuf` - Protocol Buffers runtime
- `grpcio` - gRPC support
EOF
fi

echo "🚀 Installing Python requirements..."
pip install -r requirements.txt
echo "✅ Python setup complete."
