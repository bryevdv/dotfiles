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

if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

ulimit -n 2048

# history --------------------------------------------------------------

setopt APPEND_HISTORY
setopt NO_SHARE_HISTORY
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

HISTFILE="$HOME/.$(basename "$SHELL")_history.$(uname -s)"
export HISTFILE
export HISTCONTROL=ignoredups:erasedups
export TERMINAL_HISTORY_SIZE="10000"
export HISTSIZE="$TERMINAL_HISTORY_SIZE"
export HISTFILESIZE="$TERMINAL_HISTORY_SIZE"
export SAVEHIST="$TERMINAL_HISTORY_SIZE"

# paths ----------------------------------------------------------------

# export PATH=""

# # Allow OS X tool to discover typical PATH items first
# eval "$(/usr/libexec/path_helper -s)"

# # Then add specific paths that I use.
# test -d /usr/local/opt/ruby/bin && PATH="$PATH:$_"
# test -d /opt/local/bin && PATH="$PATH:$_"
# test -d /opt/local/sbin && PATH="$PATH:$_"

# # Export currently built PATH so the rest of this script has access to them.
# if test -e /usr/libexec/path_helper; then
#     eval "$($_ -s)"
# else
#     export PATH
#     export MANPATH
# fi

# # Make sure Homebrew utilities override system utilities.
# if type brew >/dev/null 2>&1; then
#     BREW_PREFIX="$(brew --prefix)"
#     test -d "$BREW_PREFIX/bin" && PATH="$_:$PATH"
#     test -d "$BREW_PREFIX/sbin" && PATH="$_:$PATH"
#     BREW_COREUTILS_PREFIX="$(brew --prefix coreutils 2>/dev/null)"
#     if [[ $? == 0 ]]; then
#         test -d "$BREW_COREUTILS_PREFIX/libexec/gnubin" && PATH="$_:$PATH"
#         test -d "$BREW_COREUTILS_PREFIX/libexec/gnuman" && MANPATH="$_:$MANPATH"
#     fi
#     export PATH
#     export MANPATH
# fi

# # Add specific application paths, such as Python, rvm, etc...
# test -d /opt/local/lib/pkgconfig && PKG_CONFIG_PATH="$_:$PKG_CONFIG_PATH"
# test -d /usr/local/lib/pkgconfig && PKG_CONFIG_PATH="$_:$PKG_CONFIG_PATH"

# # Make sure user utilities take precedence
test -d "$HOME/bin" && PATH="$_:$PATH"
test -d "$HOME/.gitlocal/bin" && PATH="$_:$PATH"
test -d "/usr/local/opt/coreutils/libexec/gnubin" && PATH="$_:$PATH"

. ${HOME}/anaconda/etc/profile.d/conda.sh
conda activate

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# aliases --------------------------------------------------------------

alias b='python setup.py develop --build-js'
alias m=make
alias mm='make -j 8'
alias vi=vim
alias ls='ls -hF --color=auto'
alias ll='ls -l'
alias llm='ls -l | less'
alias la='ls -al'
alias lsg='ls|grep'
alias lag='la|grep'
alias grep='grep --color=auto'
alias h='history 0'
alias hg='h|grep'
alias psg='echo "  UID   PID  PPID CPU PRI NI      VSZ    RSS WCHAN  STAT  TT       TIME COMMAND";ps axwl|grep -v "grep"|grep'
alias envg='env|grep'
alias sb='subl'
alias sbn='sb -n'
alias gitgl='git log --decorate --oneline --graph'
alias grip='grin -I "*.py"'

alias go='git co'
alias pt='py.test -m "not (examples or integration or js or quality)"'

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

alias gulp=~/work/bokeh/bokehjs/node_modules/.bin/gulp

# vars -------------------------------------------------------

export GOOGLE_API_KEY="AIzaSyAM1OHVm6Yr_i54Kt01mylfxyNxQdxmxHQ"

export EDITOR=vim
export CVSEDITOR=vim
export XEDITOR=vim
export GIT_EDITOR=vim
export OSXEDITOR=sb
