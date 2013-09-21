#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

# if [[ "$OSTYPE" == darwin* ]]; then
#   export BROWSER='open'
# fi
export BROWSER='chromium'

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $HOME/bin
  $path
  /opt/android-sdk/tools/
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

#
# Temporary Files
#

if [[ -d "$TMPDIR" ]]; then
  export TMPPREFIX="${TMPDIR%/}/zsh"
  if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
  fi
fi

#
# PacMatic - don't let pacman clobber the system!
#
export warn_time="86400"  # (seconds)
# export pacman_program="packer"

# Add algs4.cs.princeton.edu packages
test -r ~/algs4/bin/config.sh && source ~/algs4/bin/config.sh

