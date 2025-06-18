.PHONY: help buf-lint buf-format buf-generate buf-breaking buf-push buf-update \
	generate-all generate-go generate-rust generate-ts generate-python generate-java generate-kotlin generate-cpp generate-csharp generate-ruby generate-php \
	setup-all setup-go setup-rust setup-ts setup-python setup-java setup-kotlin setup-cpp setup-csharp setup-ruby setup-php \
	clean clean-gen docker-build docker-run test

# Default target - show help
help:
	@ echo "Florida API Protos - Available Targets:"
	@ echo ""
	@ echo "📋 Proto Management:"
	@ echo "  buf-lint      - Lint proto files"
	@ echo "  buf-format    - Format proto files"
	@ echo "  buf-generate  - Generate code for all languages"
	@ echo "  buf-breaking  - Check for breaking changes"
	@ echo "  buf-push      - Push to Buf Schema Registry"
	@ echo "  buf-update    - Update buf dependencies"
	@ echo ""
	@ echo "🚀 Language-Specific Generation:"
	@ echo "  generate-go      - Generate Go code only"
	@ echo "  generate-rust    - Generate Rust code only"
	@ echo "  generate-ts      - Generate TypeScript code only"
	@ echo "  generate-python  - Generate Python code only"
	@ echo "  generate-java    - Generate Java code only"
	@ echo "  generate-kotlin  - Generate Kotlin code only"
	@ echo "  generate-cpp     - Generate C++ code only"
	@ echo "  generate-csharp  - Generate C# code only"
	@ echo "  generate-ruby    - Generate Ruby code only"
	@ echo "  generate-php     - Generate PHP code only"
	@ echo ""
	@ echo "🔧 Language-Specific Setup:"
	@ echo "  setup-all        - Setup all languages"
	@ echo "  setup-go         - Setup Go module"
	@ echo "  setup-rust       - Setup Rust crate"
	@ echo "  setup-ts         - Setup TypeScript package"
	@ echo "  setup-python     - Setup Python package"
	@ echo "  setup-java       - Setup Java (ready to use)"
	@ echo "  setup-kotlin     - Setup Kotlin (ready to use)"
	@ echo "  setup-cpp        - Setup C++ (ready to use)"
	@ echo "  setup-csharp     - Setup C# (ready to use)"
	@ echo "  setup-ruby       - Setup Ruby (ready to use)"
	@ echo "  setup-php        - Setup PHP (ready to use)"
	@ echo ""
	@ echo "🐳 Docker:"
	@ echo "  docker-build     - Build Docker image"
	@ echo "  docker-run       - Run code generation in Docker"
	@ echo ""
	@ echo "🧹 Maintenance:"
	@ echo "  clean            - Clean generated code"
	@ echo "  clean-gen        - Clean gen directory"
	@ echo "  test             - Run tests (if available)"
	@ echo ""
	@ echo "🎯 Common Workflows:"
	@ echo "  all              - Lint, format, generate, and setup all"
	@ echo "  generate-and-setup - Generate and setup all languages"
	@ echo "  quick-go         - Generate and setup Go only"
	@ echo "  quick-rust       - Generate and setup Rust only"
	@ echo "  quick-ts         - Generate and setup TypeScript only"

# Proto Management
buf-lint:
	@ echo "🔍 Linting proto files..."
	buf lint

buf-format:
	@ echo "✨ Formatting proto files..."
	buf format -w

buf-generate:
	@ echo "🚀 Generating code for all languages..."
	buf generate --template protos/buf.gen.yaml

buf-breaking:
	@ echo "⚠️  Checking for breaking changes..."
	buf breaking --against '.git#branch=main'

buf-push:
	@ echo "📤 Pushing to Buf Schema Registry..."
	buf push

buf-update:
	@ echo "📦 Updating buf dependencies..."
	buf dep update protos

# Language-Specific Generation
generate-all: buf-generate

generate-go:
	@ echo "🚀 Generating Go code..."
	./scripts/generate-go.sh

generate-rust:
	@ echo "🚀 Generating Rust code..."
	./scripts/generate-rust.sh

generate-ts:
	@ echo "🚀 Generating TypeScript code..."
	./scripts/generate-ts.sh

generate-python:
	@ echo "🚀 Generating Python code..."
	./scripts/generate-python.sh

generate-java:
	@ echo "🚀 Generating Java code..."
	./scripts/generate-java.sh

generate-kotlin:
	@ echo "🚀 Generating Kotlin code..."
	./scripts/generate-kotlin.sh

generate-cpp:
	@ echo "🚀 Generating C++ code..."
	./scripts/generate-cpp.sh

generate-csharp:
	@ echo "🚀 Generating C# code..."
	./scripts/generate-csharp.sh

generate-ruby:
	@ echo "🚀 Generating Ruby code..."
	./scripts/generate-ruby.sh

generate-php:
	@ echo "🚀 Generating PHP code..."
	./scripts/generate-php.sh

# Language-Specific Setup
setup-all:
	@ echo "🔧 Setting up all languages..."
	./scripts/setup-all.sh

setup-go:
	@ echo "🔧 Setting up Go module..."
	./scripts/setup-go.sh

setup-rust:
	@ echo "🔧 Setting up Rust crate..."
	./scripts/setup-rust.sh

setup-ts:
	@ echo "🔧 Setting up TypeScript package..."
	./scripts/setup-ts.sh

setup-python:
	@ echo "🔧 Setting up Python package..."
	./scripts/setup-python.sh

setup-java:
	@ echo "🔧 Setting up Java..."
	./scripts/setup-java.sh

setup-kotlin:
	@ echo "🔧 Setting up Kotlin..."
	./scripts/setup-kotlin.sh

setup-cpp:
	@ echo "🔧 Setting up C++..."
	./scripts/setup-cpp.sh

setup-csharp:
	@ echo "🔧 Setting up C#..."
	./scripts/setup-csharp.sh

setup-ruby:
	@ echo "🔧 Setting up Ruby..."
	./scripts/setup-ruby.sh

setup-php:
	@ echo "🔧 Setting up PHP..."
	./scripts/setup-php.sh

# Docker
docker-build:
	@ echo "🐳 Building Docker image..."
	docker build -t florida-api-protos .

docker-run:
	@ echo "🐳 Running code generation in Docker..."
	docker run --rm -v $(PWD):/workspace florida-api-protos

# Maintenance
clean:
	@ echo "🧹 Cleaning generated code..."
	rm -rf gen/

clean-gen:
	@ echo "🧹 Cleaning gen directory..."
	rm -rf gen/

test:
	@ echo "🧪 Running tests..."
	@ echo "No tests configured yet. Add your test commands here."

# Common Workflows
all: buf-lint buf-format buf-generate setup-all

generate-and-setup: buf-generate setup-all

quick-go: generate-go setup-go

quick-rust: generate-rust setup-rust

quick-ts: generate-ts setup-ts
