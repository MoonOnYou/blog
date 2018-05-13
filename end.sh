#!/usr/bin/env bash
# Update local repos.
git pull origin master

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding hugo files`date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
