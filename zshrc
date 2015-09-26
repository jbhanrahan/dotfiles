# https://github.com/sorin-ionescu/prezto
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
fuck() {
	ps aux | grep -ie $1 | awk '{print $2}' | xargs kill -9
}

fuck_port() {
  lsof -i tcp:$1 | awk 'NR!=1 {print $2}' | xargs kill
}

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home
export SCALA_HOME=/usr/local/opt/scala/idea
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH=$PATH:~/bin
export PATH=$PATH:~/.npm/bin
export PATH=$PATH:~/.composer/vendor/bin/
export PATH="/Applications/MAMP/bin/php/php5.6.2/bin:$PATH"
export PATH=/usr/local/sbin:$PATH
##### Random values
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


export RDECK_BASE="/Users/johnhanrahan/Victorious/Rundeck/"
export VISUAL=vim
export EDITOR="$VISUAL"

####### Random useful helpful commands ############
alias subl="open -a 'Sublime Text'"
alias mysql="/Applications/MAMP/Library/bin/mysql --host=127.0.0.1 -uroot -proot victorious"
alias gg="git log --all --graph --decorate --oneline"
alias mplayerx="open -a /Applications/MPlayerX.app"
alias cdt="cd ~/Victorious/TouchFramePlatform"
alias fix_workers="start_workers"
alias start_workers="~/Victorious/TouchFramePlatform/scripts/start_frontchannel_workers.sh local -u johnhanrahan -p ~/Victorious/TouchFramePlatform/; ~/Victorious/TouchFramePlatform/scripts/start_backchannel_workers.sh local -u johnhanrahan -p ~/Victorious/TouchFramePlatform/; ~/Victorious/TouchFramePlatform/scripts/start_backchannel_proxy.sh local -u johnhanrahan -p ~/Victorious/TouchFramePlatform/;"

