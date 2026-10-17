# ==============================================================================
# Environment Variables & Path Configuration
# ==============================================================================

# Node.js (NVM)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Go configuration
export GOPATH="$HOME/.go"
export GOROOT="$HOME/.local/go"

# Rust configuration
export CARGO_HOME="$HOME/.cargo"
export RUSTUP_HOME="$HOME/.rustup"

# .NET configuration
export DOTNET_ROOT="$HOME/.dotnet"

# General Dev Environment
export EDITOR="code"
export VISUAL="$EDITOR"
export DEBUG=0
export NODE_ENV="development"
export TERM="xterm-256color"

# Docker configuration
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# Consolidated PATH
export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$HOME/.cargo/bin:$GOPATH/bin:$GOROOT/bin:$HOME/.local/kitty.app/bin:/opt/nvim/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:$HOME/.dotnet:$HOME/.dotnet/tools:$PATH"
