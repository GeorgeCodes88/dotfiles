# ==============================================================================
# Main .zshrc
# ==============================================================================

# Basic shell options
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt INTERACTIVE_COMMENTS

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

bindkey -e

# Interactive startup
if [[ -o interactive ]]; then
    clear
    fastfetch
fi

# Load Loop

zsh_modules=(
    env.zsh          # 1. Environment variables & PATH
    prompt.zsh       # 2. Prompt, completion & colors
    alias.zsh      # 3. Custom shortcuts
    functions.zsh    # 4. Functions & ZLE widgets (fzf)
    autosuggestions.zsh
    syntax.zsh       # 5. Syntax highlighting (MUST BE LAST)
)

# Source files in order
for module in $zsh_modules; do
    file="$HOME/.zsh/$module"
    [ -r "$file" ] && source "$file"
done
