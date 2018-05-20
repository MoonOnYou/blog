#!/usr/bin/env bash
if [ -e public/.git ]
then 
    echo "public exists"
    cd public/
    git checkout .
    git pull origin master
    cd ..
else
    echo "public download..."
    git clone https://github.com/MoonOnYou/MoonOnYou.github.io.git public
fi

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
git stash
git checkout master
git pull origin master
git stash pop
