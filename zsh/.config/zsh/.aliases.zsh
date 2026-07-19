# --- Aliases ---

# General
alias wget='wget --no-hsts'
alias ls='ls --color'

# Archives
alias tgz='tar -czf'
alias ugz='tar -xzf'
alias tbz='tar -cjf'
alias ubz='tar -xjf'

# Networking
alias ip="curl http://ipecho.net/plain; echo"

# Kitty
alias theme="kitty +kitten themes --reload-in=all" # Add theme name
alias icat="kitty +kitten icat"
alias connect="kitty +kitten ssh" # prevent weird keypress handling over ssh
