#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# build
hugo

# public deploy
cd public
git checkout master
git add .
git commit -m "$msg"
git pull origin master
git push origin master


cd ..
git checkout master
git add .
git commit -m "$msg"
git pull origin master
git push origin master
