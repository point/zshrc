#
# Some parts has been taken from
# http://github.com/GothAlice/Random/blob/master/zshrc
#
# Lines configured by zsh-newuser-install
SHELL=zsh
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/point/.zshrc'

autoload -Uz compinit
compinit -C
# End of lines added by compinstall
source /etc/zsh_command_not_found

umask 022

#
# Mostly all Linux distributions used /etc/profile.d dir 
# for collecting path info
#
if [ -d /etc/profile.d ]; then
	for s in /etc/profile.d/*.sh ; do
		test -r $s -a ! -k $s && . $s
	done
fi

export DISPLAY=:0.0
export EDITOR=vim
export PAGER=less

DIRSTACKSIZE=20
# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

## This is a multiple move based on zsh pattern matching.  To get the full
### power of it, you need a postgraduate degree in zsh.
### Read /path_to_zsh_functions/zmv for some basic examples.
#autoload -U zmv
#
# Super-hyper mega brilliant bc
autoload -z zcalc

#
# Load aliaces
#
source ~/.zsh/aliases.zsh

#
# Load completion
#
source ~/.zsh/completion.zsh

#
# Load binds
#
source ~/.zsh/keybind.zsh

#
# Others
#
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export COLORFGBG="default;default"

#custom exports for coloured less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

## set colors for GNU ls ; set this to right file
export LS_COLORS='*.swp=00;44;37:*,v=5;34;93:*.vim=35:no=0:fi=0:di=32:ln=36:or=1;40:mi=1;40:pi=31:so=33:bd=44;37:cd=44;37:ex=35:*.jpg=1;32:*.jpeg=1;32:*.JPG=1;32:*.gif=1;32:*.png=1;32:*.jpeg=1;32:*.ppm=1;32:*.pgm=1;32:*.pbm=1;32:*.c=1;32:*.C=1;33:*.h=1;33:*.cc=1;33:*.awk=1;33:*.pl=1;33:*.gz=31:*.tar=31:*.zip=31:*.lha=1;31:*.lzh=1;31:*.arj=1;31:*.bz2=31:*.tgz=31:*.taz=1;31:*.html=36:*.htm=1;34:*.doc=1;34:*.txt=1;34:*.o=1;36:*.a=1;36'

source ~/.zsh/functions.zsh

#
# Load prompt
#
if [[ -f ~/.zsh/prompt.zsh ]]; then
	source ~/.zsh/prompt.zsh
else
	prompts=(~/.zsh/prompt.d/*)
	source $prompts[1]
fi
# vim: set noet ts=4 tw=80 :
