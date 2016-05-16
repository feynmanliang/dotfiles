#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
export PATH=/remote/mlsalt-2015/fl350/bachbot/humdrum-tools/humdrum/bin:$PATH
export PATH=/remote/mlsalt-2015/fl350/bachbot/humdrum-tools/humextra/bin:$PATH
