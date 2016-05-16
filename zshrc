#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Include personal settings (customize ~/.secrets as needed)
if [ -e ~/.secrets ]; then
  source ~/.secrets/zsh_env
fi

# Aliases
if [ -e ~/.aliases ]; then
  source ~/.aliases
fi

# Bind ctrl-r and ctrl-s to history search
if (( $+widgets[history-incremental-pattern-search-backward] )); then
  bindkey "^r" history-incremental-pattern-search-backward
  bindkey "^s" history-incremental-pattern-search-forward
else
  bindkey "^r" history-incremental-search-backward
  bindkey "^s" history-incremental-search-forward
fi

PATH=$HOME/rstudio-server/bin:$HOME/R/bin:$HOME/.local/bin:$PATH:$HOME/.gem/ruby/1.9.1/bin

JAVA_HOME=/usr/lib/jvm/java-default-runtime/

# add local compilation resources
export PATH=$PATH:~/usr/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-7.0/lib64:~/usr/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:~/usr/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:~/usr/include


. /home/fl350/bachbot/torch/install/bin/torch-activate
