# ==============================================================================
# Zsh Autosuggestions Configuration
# ==============================================================================

if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

    # Highlight style for suggested text
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6c7086'
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)

    # Keybinding for Shift + Tab
    bindkey '^[[Z' autosuggest-accept

    # Standard fallback (Right Arrow)
    bindkey '^[[C' autosuggest-accept
fi
