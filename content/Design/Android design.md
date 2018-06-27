---
title: "Android design"
date: 2018-06-24T00:32:35+09:00
draft: false
tags: ["안드로이드 무료 폰트" , "안드로이드 무료 아이콘"] 
---

> 안드로이드에서 마진, 패딩을 8dp단위로 사용하면 훨씬더 깔끔하고 정돈된 디자인이 된다.

# 안드로이드에 구글 폰트(무료) 적용하기 

1. 사용자 임의 폰트를 적용하기 위해서 " assets"폴더가 필요한데 ,만들어 줘야한다.

2. src폴더에 마우스 오른쪽 클리을 해서 "New -> Folder -> Assets  Folder"를 누룸
    - 사용자 폴저 구조마다 다름 현재 나는 project 단위로 폴더구조보기를 지정해놓은 상태

3. assets는 폴더명이 "assets"로 지정되 있으므로 Finish 누르면 됨

4. [google Fonts](https://fonts.google.com/?selection.family=Domine|Song+Myung)에 들어가서 마음에 드는 폰트에 + 를 누른다 

5. 다운로드한다.

6. 다운로드 후 압축을 풀면 .ttf 파일이 보이는데 이 파일을 assets 폴더에 복사해서 넣는다.

7. 만약 google fonts를 적용해야 하는 textView id이름이 "fistTitle"이고 .ttf파일 이름이 "onyou.ttf"라면

```
TextView textView = findViewById( R.id.fistTitle );
        Typeface typeface = Typeface.createFromAsset( getAssets(),"onyou.ttf" );
        textView.setTypeface( typeface );
```

# 무료 아이콘 다운로드 사이트 

> [flaticon](https://www.flaticon.com/)

1. 마음에 드는 아이콘을 선택한다
    - 왕관은 유료 아닌것은 무료이다 
    - 가로로 쭉 나열되 있는 것들은 다른 사이트로 넘어가는데 좀 귀찮음, 그냥 해당사이트게 젤 편함

2. 원하는 확장자를 누르면 색상, 크기를 선택할 수 있고, 두번째에 있는 Free download 눌러서 무료로 다운로드 한다  