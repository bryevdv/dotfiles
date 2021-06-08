#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

fpath+="/Users/bvandeven/.zprezto/modules/conda-zsh-completion/"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

plugins=(… conda-zsh-completion)
autoload -U compinit && compinit

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search   # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Customize to your needs...

if [[ $- != *i* ]]; then
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

# Make sure user utilities take precedence
test -d "$HOME/bin" && PATH="$_:$PATH"
test -d "/usr/local/opt/coreutils/libexec/gnubin" && PATH="$_:$PATH"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_porple

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
alias grip='rg -T py'
alias grip='rg -T ts'

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

alias dbchrome='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --headless --remote-debugging-port=9222 --disable-gpu https://chromium.org'
alias ptex='py.test -s -v -m examples --tb line --diff-ref FETCH_HEAD --self-contained-html --report-path=examples.html'

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# vars -------------------------------------------------------

export EDITOR=vim
export CVSEDITOR=vim
export XEDITOR=vim
export GIT_EDITOR=vim
export OSXEDITOR=sb
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=111'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/bryan/anaconda/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bryan/anaconda/etc/profile.d/conda.sh" ]; then
        . "/Users/bryan/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bryan/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
