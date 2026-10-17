# ==============================================================================
# Git Workflow Functions
# ==============================================================================

gfeat() {
  if [ -z "$1" ]; then
    echo "Usage: gfeat <branch-name>"
    return 1
  fi
  git checkout -b "feat/$1"
  echo "Created and switched to feature branch: feat/$1"
}

gfix() {
  if [ -z "$1" ]; then
    echo "Usage: gfix <branch-name>"
    return 1
  fi
  git checkout -b "fix/$1"
  echo "Created and switched to bugfix branch: fix/$1"
}

ginfo() {
  echo "📊 Git Repository Info"
  echo "──────────────────────"
  echo "Branch: $(git rev-parse --abbrev-ref HEAD)"
  echo "Commits ahead: $(git rev-list --count @{u}.. 2>/dev/null || echo 0)"
  echo "Commits behind: $(git rev-list --count ..@{u} 2>/dev/null || echo 0)"
  echo "Files changed: $(git status --porcelain | wc -l)"
  echo "──────────────────────"
}

grebase() {
  local count=${1:-5}
  git rebase -i HEAD~$count
}

gpulff() {
  git pull --ff-only
}

# ==============================================================================
# Development & Project Automation
# ==============================================================================

test-project() {
  echo "🧪 Running tests..."
  if [ -f "package.json" ]; then
    npm test
  elif [ -f "go.mod" ]; then
    go test ./...
  elif [ -f "Cargo.toml" ]; then
    cargo test
  elif [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
    pytest . || python -m pytest
  else
    echo "❌ Unknown project type - no test framework detected"
    return 1
  fi
}

build-project() {
  echo "🔨 Building project..."
  if [ -f "Makefile" ]; then
    make
  elif [ -f "package.json" ]; then
    npm run build
  elif [ -f "go.mod" ]; then
    go build ./...
  elif [ -f "Cargo.toml" ]; then
    cargo build --release
  else
    echo "❌ Unknown project type - no build system detected"
    return 1
  fi
}

format-check() {
  echo "✨ Checking code format..."
  if [ -f "Cargo.toml" ]; then
    cargo fmt --check
  elif grep -q "ruff" pyproject.toml 2>/dev/null || [ -f ".ruff.toml" ]; then
    ruff check .
  elif [ -f ".prettierrc" ] || [ -f "package.json" ]; then
    npx prettier --check .
  else
    echo "ℹ️  No formatter detected"
  fi
}

# Jump to project using fzf
go-repo() {
  local repo
  repo=$(find ~/Projects -maxdepth 2 -name .git -type d 2>/dev/null | sed 's|/.git||' | fzf --preview 'ls -la {}' --preview-window='right:30%') && cd "$repo"
}

# ==============================================================================
# fzf Integrations
# ==============================================================================

if command -v fzf > /dev/null; then
  fzf-edit() {
    local file
    file=$(fzf --preview 'bat --color=always --line-range :500 {}' \
      --bind 'enter:execute(${EDITOR:-vi} {} < /dev/tty)')
    [ -n "$file" ] && ${EDITOR:-vi} "$file"
  }

  fzf-dir() {
    local dir
    dir=$(find ${1:-.} -type d 2>/dev/null | fzf) && cd "$dir"
  }

  fzf-kill() {
    local pid
    pid=$(ps aux | fzf | awk '{print $2}') && kill -9 $pid 2>/dev/null && echo "Process killed"
  }

  # Register functions as ZLE widgets
  zle -N fzf-edit
  zle -N fzf-dir
  zle -N fzf-kill

  # Keybindings
  bindkey '^f' fzf-edit
  bindkey '^d' fzf-dir
  bindkey '^k' fzf-kill
fi

cheat() {
    if [[ -z "$1" ]]; then
        echo "Usage: cheat <command>"
        return 1
    fi
    curl -s "https://cheat.sh/$1"
}   
