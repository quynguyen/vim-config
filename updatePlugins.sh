#!/bin/sh

git submodule init
git submodule foreach git pull --rebase origin master
git submodule foreach git config --local core.excludesfile ".gitignore_submodules"
git submodule update
