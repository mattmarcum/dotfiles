# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
if [ -f ~/.bash/git-completion.bash ]; then
  . ~/.bash/git-completion.bash
fi

export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/mmarcum/go

export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

alias grhh='git reset head --hard'
alias gco='git checkout'
alias gp='git pull'
alias gcb='git checkout -b'
alias gps='git push'
alias gpu='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gs='git status'
alias glb='git for-each-ref --sort=committerdate refs/heads/ --format="%(committerdate:short) %(refname:short)"'
alias gcm='git commit -m '
alias gap='git add -p'
alias gd='git diff'
alias gpf='git push --force-with-lease'
alias gfm='git fetch origin master'
alias gfo='git fetch origin'
alias grm='git rebase origin/master'
__git_complete gco _git_checkout
alias ll='ls -la'
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
