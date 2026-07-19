# --- Zinit ---

# Install zinit if not already present
ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# --- Zsh plugins ---
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# --- Completions ---
fpath+=("$ZDOTDIR/.zcompletions")

ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/.zcompdump"
autoload -Uz compinit
compinit -d "$ZSH_COMPDUMP"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'


#  Load uv completions
_is_available uv && eval "$(uv generate-shell-completion zsh)"

zinit cdreplay -q

# --- Keybindings ---
bindkey -e
