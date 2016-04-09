# https://github.com/sorin-ionescu/prezto
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi


# Customize to your needs...
fuck() {
	ps aux | grep -ie $1 | awk '{print $2}' | xargs kill -9
}

fuck_port() {
  lsof -i tcp:$1 | awk 'NR!=1 {print $2}' | xargs kill
}

if [ -d /Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home ]; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH=$PATH:~/bin
export PATH=$PATH:~/.npm/bin
export PATH=$PATH:~/.composer/vendor/bin/
export PATH=/usr/local/sbin:$PATH


##### Random values

export VISUAL=vim
export EDITOR="$VISUAL"

####### Random useful helpful commands ############
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias subl="open -a 'Sublime Text'"
alias htop="sudo htop"
#alias mysql="/Applications/MAMP/Library/bin/mysql --host=127.0.0.1 -uroot -proot victorious"
alias gg="git log --all --graph --decorate --oneline"
alias mplayerx="open -a /Applications/MPlayerX.app"
alias cdt="cd ~/Victorious/TouchFramePlatform"
alias cde="cd ~/Victorious/victorious-es"
alias cdc="cd ~/Victorious/CMS"
alias fix_workers="start_workers"
alias start_workers="~/Victorious/TouchFramePlatform/scripts/start_frontchannel_workers.sh local -u johnhanrahan -p ~/Victorious/TouchFramePlatform/; ~/Victorious/TouchFramePlatform/scripts/start_backchannel_workers.sh local -u johnhanrahan -p ~/Victorious/TouchFramePlatform/; ~/Victorious/TouchFramePlatform/scripts/start_backchannel_proxy.sh local -u johnhanrahan -p ~/Victorious/TouchFramePlatform/;"
alias gitcleanbranches="git branch --merged | grep -v \* | xargs git branch -D"


export PATH="$HOME/.rbenv/bin:$PATH"
export TERM=screen-256color

# Print the tmux sessions on login if there are any
#tmux ls 2> /dev/null;


bak(){
  if [ ! $# -eq 0 ]; then
      if [ -e "$1.bak" ]; then
        mv -f "$1".bak "$1".bak.bak
    fi
    cp "$1" "$1".bak
  else
    echo "i need some args bro";
  fi
}

if [ -d  /usr/local/share/zsh/site-functions/_aws ]; then
  source /usr/local/share/zsh/site-functions/_aws
fi



export ES_HEAP_SIZE=4g
export PATH="$HOME/.rbenv/bin:$PATH"

if hash rbenv 2>/dev/null; then
  eval "$(rbenv init -)"
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

if [ -d  /usr/bin/keychain ]; then
  /usr/bin/keychain $HOME/.ssh/id_rsa
  source $HOME/.keychain/`hostname`-sh
fi
