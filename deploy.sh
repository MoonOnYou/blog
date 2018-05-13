#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
# 1. pull
git pull origin master
# 2. add
git add .

# 3. Commit changes.
msg="hugo md file changes ... `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
# 4. push
git push origin master

# 5. Build the project.
hugo

# 6. Go To Public folder
cd public

# 7. pull
git pull origin master

# 8. Add changes to git.
git add .

# 9. Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# 10. Push source and build repos.
git push origin master

# 11. Come Back up to the Project Root
cd ..
