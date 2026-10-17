# ==============================================================================
# Syntax Highlighting - Gruvbox Palette
# ==============================================================================

typeset -A ZSH_HIGHLIGHT_STYLES

# Commands, Builtins, and Aliases (Warm Bright Gold & Orange)
ZSH_HIGHLIGHT_STYLES[command]='fg=#fabd2f,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#fe8019,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#fabd2f'

# Paths & Globbing (Mint/Aqua Green)
ZSH_HIGHLIGHT_STYLES[path]='fg=#8ec07c,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#8ec07c'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#b8bb26'

# Options and Flags (Bright Red / Soft Coral)
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#fb4934'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#fb4934'

# Arguments, Strings, and Quotes (Cream White)
ZSH_HIGHLIGHT_STYLES[quoted-argument]='fg=#bdae93'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#bdae93'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#bdae93'

# Unknown commands / Errors (Bright Red)
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#fb4934,bold'

# Must be sourced at the end of configuration
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
