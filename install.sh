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


sudo cp -f `pwd`/scripts/shutdown_idle /opt/shutdown_idle
sudo cp -f `pwd`/scripts/shutdown_idle.service /run/systemd/system/

sudo cp -f `pwd`/scripts/update_dns /opt/update_dns
sudo cp -f `pwd`/scripts/update_dns.service /run/systemd/system/

sudo systemctl enable update_dns
sudo systemctl enable shutdown_idle 
sudo systemctl start update_dns
sudo systemctl start shutdown_idle 
