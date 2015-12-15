# Antigen
 source ~/.antigen.zsh

# Load various lib files
antigen bundle robbyrussell/oh-my-zsh lib/

# Zsh config

antigen theme robbyrussell/oh-my-zsh themes/miloshadzic

antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle tarruda/zsh-autosuggestions

antigen bundle zsh-users/zsh-history-substring-search
# Zsh other plugins
#
antigen bundle git

antigen bundle ssh-agent

alias zconf="vim ~/.zshrc"
alias zreload="source ~/.zshrc"
alias vconf="vim ~/.vimrc"
alias 4get="python ~/Documentos/py/4chan.py"
#Password generator
genpasswd() {
    local l=$1
    [ "$l" '==' "" ] && l=20
    tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
