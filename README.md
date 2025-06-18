# Florida API Protos

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This repository provides Protocol Buffer definitions for the Florida API. No generated code is included—customers generate code for their preferred language using the provided scripts or Docker.

## Quick Start

### Prerequisites
- [Buf CLI](https://buf.build/docs/installation)
- [Docker](https://www.docker.com/) (optional, for containerized generation)

### Generate Code for All Languages
```bash
./scripts/generate-all.sh
```

### Generate Code for a Specific Language
```bash
./scripts/generate-go.sh      # Go
./scripts/generate-rust.sh    # Rust
./scripts/generate-ts.sh      # TypeScript
./scripts/generate-python.sh  # Python
./scripts/generate-java.sh    # Java
./scripts/generate-kotlin.sh  # Kotlin
./scripts/generate-cpp.sh     # C++
./scripts/generate-csharp.sh  # C#
./scripts/generate-ruby.sh    # Ruby
./scripts/generate-php.sh     # PHP
```

### Setup Language-Specific Environment
```bash
# Setup all languages that have generated code
./scripts/setup-all.sh

# Or setup individual languages
./scripts/setup-go.sh         # Go
./scripts/setup-rust.sh       # Rust
./scripts/setup-ts.sh         # TypeScript
./scripts/setup-python.sh     # Python
./scripts/setup-java.sh       # Java
./scripts/setup-kotlin.sh     # Kotlin
./scripts/setup-cpp.sh        # C++
./scripts/setup-csharp.sh     # C#
./scripts/setup-ruby.sh       # Ruby
./scripts/setup-php.sh        # PHP
```

### Using Docker
You can generate code in a containerized environment:
```bash
docker build -t florida-api-protos .
docker run --rm -v $(pwd):/workspace florida-api-protos
```

## Project Structure
```
protos/                    # Protocol Buffer definitions
├── properties/v1/
│   └── properties.proto
├── templates/             # Language-specific generation templates
│   ├── buf.gen.go.yaml
│   ├── buf.gen.rust.yaml
│   ├── buf.gen.ts.yaml
│   └── ... (other languages)
└── buf.gen.yaml          # Main generation config (all languages)
scripts/                   # Scripts for code generation and setup
├── generate-*.sh         # Language-specific generation scripts
├── setup-*.sh           # Language-specific setup scripts
└── setup-all.sh         # Setup all languages
Dockerfile                 # For containerized code generation
buf.yaml, buf.lock         # Buf configuration
Makefile                   # (Optional) for advanced workflows
LICENSE                    # MIT License
```

## How to Use
1. Clone this repository
2. Generate code for your language using the scripts or Docker
3. Setup the language environment using the setup scripts
4. Integrate the generated code into your project

## Supported Languages

| Language | Generate Script | Setup Script | Notes |
|----------|----------------|--------------|-------|
| Go | `generate-go.sh` | `setup-go.sh` | Creates go.mod, adds dependencies |
| Rust | `generate-rust.sh` | `setup-rust.sh` | Creates Cargo.toml, src/lib.rs, build.rs |
| TypeScript | `generate-ts.sh` | `setup-ts.sh` | Creates package.json, tsconfig.json |
| Python | `generate-python.sh` | `setup-python.sh` | Creates requirements.txt, setup.py |
| Java | `generate-java.sh` | `setup-java.sh` | Ready to use |
| Kotlin | `generate-kotlin.sh` | `setup-kotlin.sh` | Ready to use |
| C++ | `generate-cpp.sh` | `setup-cpp.sh` | Ready to use |
| C# | `generate-csharp.sh` | `setup-csharp.sh` | Ready to use |
| Ruby | `generate-ruby.sh` | `setup-ruby.sh` | Ready to use |
| PHP | `generate-php.sh` | `setup-php.sh` | Ready to use |

## Contributing
- Edit proto files in `protos/`
- Update scripts as needed
- Do not commit generated code
- Follow the existing script patterns for new languages

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

The MIT License allows you to:
- Use the code for commercial purposes
- Modify the code
- Distribute the code
- Use it privately
- Sublicense the code

The only requirement is that the license and copyright notice must be included in all copies or substantial portions of the software.
