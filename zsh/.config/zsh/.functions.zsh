# --- Functions ---
# https://github.com/mrusme/dotfiles/blob/master/.zshrc
function _is_available {
  prog="${1}"
  os="${2}"
  if [ "${os}" != "" ] && [ "${os}" != "${OS}" ]
  then
    return 1
  fi
  type "${prog}" > /dev/null
  return "$?"
}
