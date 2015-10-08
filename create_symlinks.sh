SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )" #Dir is the fully resolved path that the script is located in

makeSymlink () {
  cp -r "$1" $DIR/bak/
  rm -rf $2;
  ln -s $1 $2;
}

rm -rf $DIR/bak/*
makeSymlink "`pwd`/init.el" ~/.emacs.d/init.el;
makeSymlink "`pwd`/zshrc" ~/.zshrc;
makeSymlink "`pwd`/vimrc" ~/.vimrc;
makeSymlink "`pwd`/tmux.conf" ~/.tmux.conf;
makeSymlink "`pwd`/bin" ~/bin;

