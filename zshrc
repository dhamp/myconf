# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"
#ZSH_THEME="minimal"
#ZSH_THEME="amuse"
#ZSH_THEME="juanghurtado"
#ZSH_THEME="rkj-repos"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Set to this to use case-sensitive completion
 CASE_SENSITIVE="true"
# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"
# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13
# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"
# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"
# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa.home
#zstyle :omz:plugins:envoy identities id_rsa id_rsa.home

plugins=(archlinux gitfast systemd svn mercurial history-substring-search screen)
source $ZSH/oh-my-zsh.sh
# Customize to your needs...
setopt histignorespace

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.*)     tar xf $1      ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       7z x $1        ;;
            *.gzip|*.gz) gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xf $1      ;;
            *.tgz)       tar xf $1      ;;
            *.zip)       7z x $1        ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *.rar)       7z x $1        ;;
            *.xz)        unxz -k $1     ;;
            *)           echo "Unable to decompress  '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

compress () {
    if [ $1 ]; then
        case $1 in
            tbz)
                tar cjvf $2.tar.bz2 $2 ;;
            tgz)
                tar czvf $2.tar.gz $2 ;;
            txz)
                tar cJvf $2.tar.xz $2 ;;
            tar)
                tar cpvf $2.tar $2 ;;
            bz2)
                bzip $2 ;;
            gz)
                gzip -c -9 -n $2 > $2.gz ;;
            zip)
                7z a $2.zip $2 ;;
            7z)
                7z a $2.7z $2 ;;
            xz)
                xz -z $2.xz $2 ;;

            *)
                echo "Unable to compress '$1'" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

alias df='df -h'
alias du='du -h'
alias y="/usr/bin/yaourt"
alias m="/usr/bin/makepkg"
alias s="/usr/bin/sudo"
alias ban="/usr/bin/sudo iptables -I INPUT -j DROP -s"
alias unban="/usr/bin/sudo iptables -D INPUT -j DROP -s"
alias banfw="/usr/bin/sudo iptables -I FORWARD -j DROP -s"
alias unbanfw="/usr/bin/sudo iptables -D FORWARD -j DROP -s"
alias valgrind="valgrind --track-origins=yes --leak-check=full"
alias mount.iso="sudo mount -t iso9660 -o loop"
alias mount.mdf="sudo mount -o loop"
alias mount.nrg="sudo mount -o loop,offset=307200"
alias mount.mdx="sudo mount -o loop,offset=64"
alias srv="systemctl --user"
alias gh="githelper.py"

#export PATH=$HOME/bin:/usr/lib/ccache/bin/:$PATH
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl

#source $HOME/projects/deer/deer
#zle -N deer-launch
#bindkey '\ek' deer-launch

export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/ssh-agent-socket

[[ -e ${SSH_AUTH_SOCK} ]] && for i in `ls $HOME/.ssh/{id_rsa,id_rsa.home}`; do [[ -z $(ssh-add -l | grep ${i} | head -n 1) ]] && ssh-add ${i}; done

/usr/bin/sudo loginctl enable-linger $USER
