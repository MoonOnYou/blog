#!/usr/bin/env bash
git submodule init
git submodule update

if [ -e themes/minimal/.git ]
then
    echo "minimal exists"
    # cd themes/minimal/
    # git checkout .
    # git pull origin master
    # cd ../..
else
    echo "minimal download..."
    cd themes/
    git clone https://github.com/calintat/minimal.git minimal
    cd ..
fi
git checkout master
git pull origin master
