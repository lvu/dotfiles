#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias wget='wget --content-disposition'
alias sqlplus='rlwrap sqlplus'
alias sml='rlwrap sml'
alias pyack='ack --python'
alias pyag='ag --python'
alias vim='/usr/bin/launch-python-vim.sh'
alias :e='vim'
PS1='[\u@\h \W]\$ '
export ORAENV_ASK=NO
export ORACLE_SID=BAN
export PATH=$PATH:/home/lvu/.npm/less/1.3.3/package/bin/:/home/lvu/getgoing/arcanist/bin/:/opt/heroku-client/bin/:/opt/java/bin:/home/lvu/.gem/ruby/2.1.0/bin:/home/lvu/bin
shopt -s checkwinsize
export HISTCONTROL=ignoredups
#. oraenv

export WORKON_HOME=~/virtual-envs
export MAKEFLAGS='-j 8'
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%h %d %H:%M:%S "
PROMPT_COMMAND="$PROMPT_COMMAND; history -a"
. /usr/bin/virtualenvwrapper.sh
. /usr/lib/z.sh

TF_ALIAS=fuck alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

