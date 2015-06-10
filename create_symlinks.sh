makeSymlink () {
  rm -rf $2;
  ln -s $1 $2;
}

makeSymlink "`pwd`/init.el" ~/.emacs.d/init.el;
makeSymlink "`pwd`/zshrc" ~/.zshrc;
makeSymlink "`pwd`/vimrc" ~/.vimrc;
makeSymlink "`pwd`/bin" ~/bin;


