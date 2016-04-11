#!/bin/bash


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#cd ~/.vim/bundle/command-t/ruby/command-t
#ruby extconf.rb
#make

rm -rf ~/.emacs.d/
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

#Install oh my zsh
#rm -rf ~/.oh-my-zsh/;
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

echo "source $HOME/dotfiles/zshrc" >> ~/.zshrc;


git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`


sudo cp scripts/update_dns /opt/update_dns
sudo cp scripts/update_dns.service /usr/lib/systemd/system/update_dns.service
sudo cp scripts/shutdown /etc/cron.hourly/
