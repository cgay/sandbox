# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


### Basics

alias ll='ls -al --color'

export PATH=${HOME}/bin:/usr/local/bin:/usr/bin:/bin

if [[ "$(hostname)" == "Raven.local" ]]; then
    export PATH=/opt/homebrew/bin:${PATH}
fi

# Pass $TERM (usually xterm-256color) through to screen so that colors work
# better. (Primarily I was seeing some RST headers being black on black.)
alias start_screen='screen -e^jj -T screen-256color'
alias tmux='tmux -2'            # force 256 colors


### Emacs

# shell buffers
if [[ -n "${INSIDE_EMACS}" ]]; then
    export PAGER=/bin/cat
    export TERM=emacs           # colorization works, e.g., for git diff
fi


if [[ "$(hostname)" == "Raven.local" ]]; then
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
else
    # This is for my Linode Debian machine, where I'm always inside screen and
    # emacsclient can cause problems with 'git rebase -i' which I'm too lazy to
    # debug.
    alias emacs='PAGER=/bin/cat emacs -nw'
fi
export EDITOR=emacs


### Dylan

export DYLAN=${HOME}/dylan
export PATH=${DYLAN}/bin:${DYLAN}/opendylan/bin:${PATH}
export DW=${DYLAN}/workspaces

# I don't generally like to set any of the OPEN_DYLAN_* variables, but I think
# this is innocuous enough. My current understanding: It's useful when using
# LSP because it causes the compiler to create <registry-project>s instead of
# <binary-project>s. See https://github.com/dylan-lang/lsp-dylan/issues/23 for
# background. I'm not 100% sure I've understood the problem correctly.
export OPEN_DYLAN_USER_REGISTRIES=${OD}/sources/registry

# Specific workspaces
export DT=${DW}/dylan-tool
export LSP=${DW}/lsp-dylan
if [[ "$(hostname)" == "Raven.local" ]]; then
    export OD=${DW}/opendylan
else
    export OD=${DW}/od/opendylan
fi
export PB=${DW}/protocol-buffers
export DP=${DW}/dylan-playground

# Temp fix for regular-expressions library hang problem.
#export LD_PRELOAD=/home/cgay/libunwind/install/lib/libunwind.so.8

### Shell prompt

bash_prompt_cmd() {
    if [ $? -eq 0 ]; then
        prompt_err=""
    else
        prompt_err="[$exitcode] "
    fi
    wd=${PWD/${HOME}/\~}
    find_git_status
    export PS1="\n\t ${wd} ${prompt_err}${git_status}\n$ "
}

find_git_status() {
    local status=$(git status --porcelain --untracked-files=no 2> /dev/null)
    git_dirty=''
    if [[ "$status" != "" ]]; then
        git_dirty='*'
    fi
    local branch
    git_status=""
    if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
        if [[ $? -eq 0 ]]; then
            git_status="(${branch}${git_dirty}) "
        fi
    fi
}

PROMPT_COMMAND="bash_prompt_cmd; $PROMPT_COMMAND"

alias git_gc='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'

### Go

export PATH=${PATH}:/usr/local/go/bin
export GOPATH=${HOME}/go


### Lisp

#export PATH=${HOME}/google/protobuf-install-dir/bin:$PATH
