#!/bin/bash

if [[ "$#" -eq 0 ]]; then
  echo 'No arguments passed!'
  exit 0
fi

cd ~/.dotfiles

function lndot {
  modulefile="$PWD/$1"
  destfile=$2
  echo "[37mAttempting to symlink [1m$modulefile[0;37m to [1m$destfile[0;37m...[0m"

  if [[ -h $destfile ]]; then
    echo "[37mSymlink already exsists at [1m$destfile[0;37m and will be replaced.[0m"
    rm -r $destfile 2>/dev/null \
    || sudo rm -r $destfile \
    || (echo "[31mError occurred while removing existing file [1m$destfile[0;31m.[0m" && return)
  elif [[ -e $destfile ]]; then
    read -p "[31mFile [1m$destfile[0;31m exists.[0m Remove it? [Y/n]: " -n 1 yn

    if [[ $yn =~ [yY]? ]]; then
      sudo rm -r $destfile
    elif [[ $yn =~ [nN] ]]; then
      echo '[37mSkipping...[0m'
    fi
  fi

  echo "[37mLinking...[0m"
  ln -s $modulefile $destfile 2>/dev/null \
  || sudo ln -s $modulefile $destfile \
  || (echo "[31mError occurred while linking [1m$modulefile[0;31m to [1m$destfile[0;31m.[0m" && return)
  echo "[92mLinked [1m$modulefile[0;92m to [1m$destfile[0;92m![0m"
}

for module in $@; do
  echo "[37mLinking module [1m$module[0;37m...[0m"
  if [[ ! -d $module ]]; then
    echo -e "[31mModule [1m$module[0;31m not found.[0m\n"
    continue
  fi

  cd $module

  if [[ -f '.lndot.sh' ]]; then
    echo '[37mFound [1m.lndot.sh[0;37m.[0m'
    . ./.lndot.sh
  else
    echo '[37mDid not find [1m.lndot.sh[0;37m. Using default linking.[0m'
    lndot '' ~/.config/$module
  fi

  echo -e "[92mDone![0m\n"
  cd - > /dev/null
done

cd - > /dev/null
