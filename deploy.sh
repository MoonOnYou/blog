#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

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

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git pull origin master
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..

git pull origin master
git add .

# Commit changes.
msg="hugo rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master