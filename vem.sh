#!/usr/bin/env bash
# vim environment management
# https://en.wikibooks.org/wiki/Bash_Shell_Scripting[Bash Shell Scripting - Wikibooks, open books for an open world]
# http://wiki.bash-hackers.org/howto/getopts_tutorial[Small getopts tutorial [Bash Hackers Wiki]]
# https://github.com/alebcay/awesome-shell[alebcay/awesome-shell: A curated list of awesome command-line frameworks, toolkits, guides and gizmos. Inspired by awesome-php.]

if ! [[ -d $HOME/VIM ]]; then
  echo 'generate ~/VIM for save settings'
  mkdir $HOME/VIM
fi

if [[ -e $HOME/.vimrc ]] && [[ -d $HOME/.vim ]]; then
  echo ".vimrc and .vim exist"
else
  echo "no .vimrc and .vim diretory"
fi

# copy ~/.vim, ~/.vimrc to ~/VIM/somedir
backup() {
  if [[ "$1" == 't' ]]; then
    dir=`date +"%s"`
  else
    dir=$1
  fi
  mydir=$HOME/VIM/$dir
  mkdir $mydir
  cp -pr $HOME/.vim $mydir
  cp -p $HOME/.vimrc $mydir
  echo "backup $# $mydir done"
}

# delete ~/.vimrc and ~/.vim
to_empty() {
  case "$1" in
    [yY])
      echo "you say Y"
      echo "remove .vimrc, .vim"
      rm $HOME/.vimrc
      rm -rf $HOME/.vim
      ;;
    *)
      echo "do nothing";;
  esac
}

# restore VIM repo to HOME
restore() {
  if [[ -e $HOME/.vimrc ]] || [[ -d $HOME/.vim ]]; then
    echo "Home have .vimrc or .vim, empty first"
    exit 0
  elif [[ -d $HOME/VIM/$1 ]]; then
    echo "will restore to HOME"
    cp -p $HOME/VIM/$1/.vimrc $HOME/.vimrc
    cp -rp $HOME/VIM/$1/.vim $HOME/.vim
  else
    echo "no $1 dir"
  fi
}

__ScriptVersion="0.1"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
function usage ()
{
  echo "Usage :  $0 [options] [--]

    Options:
    -h|help       Display this message
    -v|version    Display script version
    -l|list       List VIM repos
    -c|create     Create VIM repos dir
    -r|restore    restore from VIM repos
    -e|empty      empty .vimrc .vim
    -b|backup     backup .vim* to VIM repos dir"

}    # ----------  end of function usage  ----------

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hvleb:c:r:" opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;

  l|list  )  ls -l $HOME/VIM; exit 0   ;;

  e|empty  )  read -r -p "確認要刪嗎？[y/N] " response; to_empty $response; exit 0   ;;

  b|backup  )  backup $OPTARG; exit 0   ;;

  r|restore  ) restore $OPTARG; exit 0   ;;

  c|create  )  echo "will create $HOME/VIM/$OPTARG"; exit 0   ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

