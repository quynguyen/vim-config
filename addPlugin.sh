#!/bin/sh

url=$1
plugin=$( basename -s .git $url )
BUNDLE_PATH=vim/bundle
path=$BUNDLE_PATH/$plugin

echo "Adding plugin: $plugin, to $path"
git submodule add $url $path
git --work-tree=$path --git-dir=$path/.git config --local core.excludesfile ../../../.gitignore_submodules
