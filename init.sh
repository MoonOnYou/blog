#!/usr/bin/env bash
# submoudule update
git submodule init
git submodule update

if [ -e themes/minimal/.git ]
then
    echo "hugo-theme-dream exists"
    # cd themes/minimal/
    # git checkout .
    # git pull origin master
    # cd ../..
else
    echo "hugo-theme-dream download..."
    cd themes/
    git clone https://github.com/g1eny0ung/hugo-theme-dream.git hugo-theme-dream
    cd ..
fi
git checkout master
git pull origin master
