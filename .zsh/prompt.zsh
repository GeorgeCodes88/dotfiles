# ==============================================================================
# Prompt, Colors & Completion Setup - Distinct File/Folder Palette
# ==============================================================================

autoload -Uz colors && colors
setopt PROMPT_SUBST

# Completion configuration
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format ' %F{241}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true

zstyle ':completion:*' matcher-list \
    'm:{a-z}={A-Z}' \
    'r:|[._-]=* r:|=*'

eval "$(dircolors -b)"

# Initialize Starship
eval "$(starship init zsh)"

# Distinct Gruvbox File Listing Colors for eza / ls
# di = Directories (Bold Bright Yellow/Gold)
# fi = Regular Files (Soft Cream)
# ln = Symlinks (Mint Aqua)
# ex = Executables (Bright Red/Orange)
# *.tar/*.gz/*.zip = Archives (Warm Terracotta Orange)
LS_COLORS='di=1;38;5;214:fi=0;38;5;223:ln=38;5;108:ex=1;38;5;208:*.tar=38;5;166:*.gz=38;5;166:*.zip=38;5;166:*.7z=38;5;166'
export LS_COLORS

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
