# --- OrbStack ---
# Command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# --- Homebrew ---
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# --- ${PATH} ---
# JetBrains Toolbox App
export PATH="$PATH:/Users/julian/Library/Application Support/JetBrains/Toolbox/scripts"

# php.new
export PATH="/users/julian/.config/herd-lite/bin:$PATH"

# --- OS Detection ---
export OS="$(uname | tr '[:upper:]' '[:lower:]')"
