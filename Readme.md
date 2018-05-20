# 로컬 서버시작
```sh
hugo server -w
```

# 새로운 카테고리 배포에 리스트에 연결
```
1. 새로운 카테고리 git 레파지토리 생성
ex) git repo name: MBlog_post_kotlin

2. git repo url 서브모듈로 등록
git submodule add -b master <git repo url> content/<카테고리명>
ex) git submodule add -b master https://github.com/JinHwanJung/Mblog_post_python content/Python

3. config.toml 에 메뉴로 등록
```

# 새 글 작성
```sh
hugo new 카테고리/글제목.md
```

