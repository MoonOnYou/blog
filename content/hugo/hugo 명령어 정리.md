---
title: "Hugo 명령어 정리"
date: 2018-05-12T22:22:46+09:00
draft: false
tags: ["hugo"]
---
# Hugo 명령어 정리
## 1. 새 글을 작성하는 방법

> hugo프로젝트 최상위 폴더에서 터미널을 연다.

```sh
hugo new 폴더이름/글제목.md
 ex) hugo new kotlin/"글 제목입니다.md"
```

- 제목에 띄어쓰기가 있으면 " "(큰 따옴표)로 묶어준다.

## 2. 로컬 환경에서 테스트 하는 방법

> hugo프로젝트 최상위 폴더에서 터미널을 연다.

```sh
hugo server 또는 hugo server -D=true
```
- D=true는 "draft"가 "false"인 파일을 로컬환경에서 볼 수 있는 권한을 주는 것임
- 이렇게 하면 웹 브라우저에 http://localhost:1313/ 로 접속헤서 만들어진 페이지를 볼 수 있다.
- 코드를 새로고침 할 때 마다 반영됨 (커밋은 안된 상태)
 
## 3. 베포 스크립트 만들기 

> <code>hugo</code> 명령을 통해 생성된 정적 웹 파일들(/public/ 에 위치하게됨)을 github page로 업로드 하는 스크립트

```sh
 #!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

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
```

- 스크립트 실행 방법
    - 위의 스크립트를 deploy.sh (제목상관없음) 파일에 저장한 후 아래 명령을 실행한다.

```sh
# deploy.sh 파일에 user 실행권한 주기, 최초 1회만 실행 
sudo chmod u+x deploy.sh

# 스크립트 실행하여 commit & push 
./deploy.sh
```
- 블로그 글 md 파일에서 글 속성 중 draft가 false인 것만 배포가 된다.

```sh
ex) 
title: "First"
date: 2018-05-12T22:22:46+09:00
draft: false
```
