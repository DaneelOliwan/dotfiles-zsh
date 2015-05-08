#!/usr/bin/env zsh
#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
#
 
# Complétion 
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# Crée un cache des complétion possibles
# très utile pour les complétion qui demandent beaucoup de temps
# comme la recherche d'un paquet aptitude install moz<tab>
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# des couleurs pour la complétion
# faites un kill -9 <tab><tab> pour voir :)
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
 
# Correction des commandes
setopt correctall
 
#export PS1='%~ $(git_branch)%# '


setopt PROMPT_SUBST
function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

# Un petit prompt sympa
autoload -U promptinit
promptinit
#prompt adam2
#prompt fire
export PS1=$'\n%n@%M:%~ %S$(git_branch)%s\n>> %'


 
# Les alias marchent comme sous bash
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias lll='ls --color=auto -lh | less'
# marre de se faire corriger par zsh ;)
alias xs='cd'
alias sl='ls'
# mplayer en plein framme buffer ;)
alias mplayerfb='mplayer -vo fbdev -vf scale=1024:768'
# Un grep avec des couleurs :
export GREP_COLOR=31
alias grep='grep --color=auto'
alias xte='nohup xterm &' # xte lancera un xterm qui ne se fermera pas si on ferme le terminal

#PATH=$PATH:~/Jeux:~/Informatique/Scripts

alias ssh_="ssh friedrit@ensibm.imag.fr"
alias sshr="ssh friedrit@daneeloliwan.no-ip.biz"
alias :q="exit"
# Pareil pour les variables d'environement :
#export http_proxy="http://hostname:8080/"
#export HTTP_PROXY=$http_proxy
# un VRAI éditeur de texte ;)
export EDITOR=/usr/bin/vim


autoload -U zsh-mime-setup
autoload -U zsh-mime-handler
zsh-mime-setup

alias -s tex="vim "
alias -s txt="vim "

zstyle ':completion:*:*:vim:*' ignored-patterns '*.o'
#alias sublime="/opt/sublime_text/sublime_text"
setopt autocd
unsetopt correct_all
source ~/.dotfiles/z/z.sh
if [ -f ~/.dotfiles/dotfiles-zsh/privaterc ]
then
    source ~/.dotfiles/dotfiles-zsh/privaterc
fi
