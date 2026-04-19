# plexideas/homebrew-tap

Homebrew tap for [plexideas](https://github.com/plexideas) tools.

## Installation

```sh
brew tap plexideas/tap
```

## Formulae

### rei-graph

Local-first developer memory + DAG execution layer for coding agents.

```sh
brew install plexideas/tap/rei-graph
```

#### Requirements

- macOS (arm64 or x86_64) or Linux (via Linuxbrew)
- [Docker](https://www.docker.com/) — required to run the Neo4j backing store (`rei dev start`)

#### Quick start

```sh
# Install
brew install plexideas/tap/rei-graph

# Verify
rei --version
rei doctor

# Initialise a project
cd my-project
rei init

# Scan source files into the graph
rei scan

# Query the graph
rei query "what does AuthService depend on?"
```

#### Updating

```sh
rei update
# or equivalently:
brew upgrade rei-graph
```

#### Uninstalling

```sh
brew uninstall rei-graph
```
