# --- Basics ---

# Ensure runtime directories exist
mkdir -p "$XDG_DATA_HOME/zsh"
mkdir -p "$XDG_CACHE_HOME/zsh"
mkdir -p "$XDG_STATE_HOME/zsh"

# --- Source Additional Config Files ---

# Source aliases
[ -f "$ZDOTDIR/.aliases.zsh" ] && source "$ZDOTDIR/.aliases.zsh"

# Source functions
[ -f "$ZDOTDIR/.functions.zsh" ] && source "$ZDOTDIR/.functions.zsh"

# Source zinit
[ -f "$ZDOTDIR/.zinit.zsh" ] && source "$ZDOTDIR/.zinit.zsh"

# --- History ---
export HISTFILE="$XDG_STATE_HOME/zsh/.zsh_history"
export HISTSIZE=5000
export SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# --- ${PATH} ---
export ANDROID_HOME="$HOME/Library/Android/sdk"
export NDK_HOME="$ANDROID_HOME/ndk/30.0.15729638"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"

# --- Programs & Tools ---

# bat: https://github.com/sharkdp/bat
_is_available bat \
&& alias cat=bat

# mise: https://mise.jdx.dev
_is_available mise \
&& eval "$(mise activate zsh)"

# fzf: https://github.com/junegunn/fzf
_is_available fzf \
&& eval "$(fzf --zsh)"
