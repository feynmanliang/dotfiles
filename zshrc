# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fliang"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby archlinux vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/share/perl5/vendor_perl/auto/share/dist/Cope:$PATH
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export PATH=$PATH:/usr/bin/core_perl:/usr/bin/vendor_perl/:/usr/bin/site_perl/
export PATH=$PATH:~/.gem/ruby/1.9.1/bin/:~/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Install bundler gems to hoem directory
export GEM_HOME=~/.gem/ruby/1.9.1/bin/

# text editors are not OSes
set -o vi
export EDITOR="vim"
export VISUAL="vim"

# vim ZSH keybindings with normal reverse search
bindkey -v                                          # Use vi key bindings
bindkey '^r' history-incremental-search-backward    # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey '^s' history-incremental-search-forward     # [Ctrl-r] - Search forward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
bindkey "^[[A" history-search-backward # up and down partial matching
bindkey "^[[B" history-search-forward # up and down partial matching

# Include personal settings (customize ~/.secrets as needed)
if [ -e ~/.secrets ]; then
  source ~/.secrets
fi

# Aliases
if [ -e ~/.aliases ]; then
  source ~/.aliases
fi

# Color grep output
export GREP_COLOR='1;33'

# mutt background fix
export COLORFGBG="default;default"

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
