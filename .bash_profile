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
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias aws='docker run --rm -it -v ~/.aws:/root/.aws cgswong/aws:aws'
alias ecr-login='eval $(aws --region us-east-2 ecr get-login --no-include-email | sed "s|https://.*|https://docker.oaganalytics.com|")'
alias ecr-raw-login='eval $(aws ecr get-login --no-include-email | sed "s|\(https://.*\.com\).*$|\1|")'
export OAG_HOME=~/oag #This is deprecated in favor of OAG_DIR, but not everything is switched over yet
export OAG_DIR=~/oag/.oag
alias grhh='git reset head --hard'
alias gco='git checkout'
alias gp='git pull'
alias gcb='git checkout -b'
alias gps='git push'
alias gpu='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gs='git status'
alias gcm='git commit -m'
