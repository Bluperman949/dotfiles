#!/bin/bash

if [[ "$#" -eq 0 ]]; then
  echo 'No arguments passed!'
  exit 0
fi

function makelink {
  modulefile=$1
  destfile=$2
  echo "[37mAttempting to link [1m$modulefile[0;37m to [1m$destfile[0;37m...[0m"

  if   [[ -h $destfile ]]; then
    echo "[37mSymlink at [1m$destfile[0;37m already exsists and will be replaced.[0m"
    rm $destfile
  elif [[ -e $destfile ]]; then
    read -p "[31mFile [1m$destfile[0;31m exists.[0m Remove it? [Y/n]: " -n 1 yn

    [[ $yn =~ [yY]? ]] && rm -rf $destfile;
    if [[ $yn =~ [nN] ]]; then echo '[37mSkipping...[0m'; return; fi
  fi

  echo "[92mLinking [1m$modulefile[0;92m to [1m$destfile[0;92m...[0m"
  ln -s $modulefile $destfile
}

for module in $@; do
  cd $module
  echo "[37mLinking module [1m$module[0;37m...[0m"

  if [[ -f 'setup.sh' ]]; then
    echo '[92mFound [1msetup.sh[0;92m, running...[0m'
    ./setup.sh
    echo '[92mFinished setup![0m'
  fi

  # get destination from .lndot
  if [[ -f '.lndot' ]]; then
    dest=$(cat .lndot | sed "s%~%$HOME%")
  # check for single-file config, like .config/starship.toml
  elif [[ $(ls -1A | wc -l) -eq 1 ]]; then
    dest="@$HOME/.config"
  # default to whole-folder config, like .config/nvim/*
  else
    dest="$HOME/.config/$module"
  fi

  # the @ char means "link every file individually"
  if [[ ${dest:0:1} == @ ]]; then
    dest=${dest:1}

    # create link every file in this module
    for file in $(ls -A -I 'setup.sh' -I '.lndot'); do
      # expand globs
      dest=$(eval "echo $dest")
      makelink $PWD/$file $dest/$file
    done
  # the ! char means "don't link anything"
  elif [[ ${dest:0:1} == ! ]]; then
    echo "[37mThis module should not be linked. Skipping it.[0m"
  else
    # link the whole folder
    makelink $PWD $dest
  fi

  echo -e "[92mDone![0m\n"
  cd ..
done
