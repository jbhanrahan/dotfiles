#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home
alias subl="open -a 'Sublime Text'"
alias mysql="/Applications/MAMP/Library/bin/mysql --host=127.0.0.1 -uroot -proot victorious"
alias gg="git log --all --graph --decorate --oneline"
alias mplayerx="open -a /Applications/MPlayerX.app"
alias cdt="cd ~/Victorious/TouchFramePlatform"
alias cdb="cd ~/Victorious/VictoriousBackend/backendV2"
alias fix_workers="start_workers"
alias start_workers="~/Victorious/TouchFramePlatform/scripts/start_frontchannel_workers.sh local -u johnhanrahan -p ~/Victorious/TouchFramePlatform/; ~/Victorious/TouchFramePlatform/scripts/start_backchannel_workers.sh local -u johnhanrahan -p ~/Victorious/TouchFramePlatform/; ~/Victorious/TouchFramePlatform/scripts/start_backchannel_proxy.sh local -u johnhanrahan -p ~/Victorious/TouchFramePlatform/;"
export PATH=$HOME/bin:$PATH


#alias zookeeperStart="lsof -n -i4TCP:2181 | grep LISTEN | awk '{print $2}' | xargs kill & /Users/johnhanrahan/Victorious/zookeeper-3.4.6/bin/zkServer.sh start-foreground"

#alias wat = function(){
#  killListener(2181)
#}

#function killListener() {
#  lsof -n -i4TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill
#}


fuck() {
      ps aux | grep -ie $1 | awk '{print $2}' | xargs kill -9
    }

fuck_port() {
  lsof -i tcp:$1 | awk 'NR!=1 {print $2}' | xargs kill
}

#source ~/.rbenv/completions/rbenv.zsh

export NVM_DIR="/Users/johnhanrahan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm



eval "$(rbenv init -)"

export PATH=$PATH:"/Users/johnhanrahan/Victorious/kafka_2.10-0.8.2.0/bin/"
export RDECK_BASE="/Users/johnhanrahan/Victorious/Rundeck/"
export PATH="/Applications/MAMP/bin/php/php5.6.2/bin:$PATH"
export VISUAL=vim
export EDITOR="$VISUAL"
