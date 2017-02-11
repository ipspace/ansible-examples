#!/bin/bash

base_dir=/opt/netprod/configs
cd $base_dir
git_directories=`ls | grep -v update-git.sh`
timestamp=`date "+%Y-%m-%d %H:%M"`

for git_dir in $git_directories ; do
  i=0
  echo $git_dir
  cd $base_dir/$git_dir
  added_devices=`git status -s | awk '{ print $1 " " $2 }' | grep -E  '^\?\? ' | awk '{ print $2 }'`
  modified_devices=`git status -s | awk '{ print $1 " " $2 }' | grep -E  '^M ' | awk '{ print $2 }'`
  for device in $added_devices ; do
    #echo "Added $device $timestamp"
    git add $device
    git commit -m "Added $device $timestamp"
    let i=($i+1)
  done
  for device in $modified_devices ; do
    #echo "Updated $device $timestamp"
    git add $device
    git commit -m "Updated $device $timestamp"
    let i=($i+1)
  done
  if [ "$i" -gt "0" ]
   then
    git push -u origin master
  fi
done