#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'		# We're using lsd now! (TRIPPY!)
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

PS1='[\u@\h \W]\$ '
