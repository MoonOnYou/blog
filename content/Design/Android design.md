---
title: "Android design"
date: 2018-06-24T00:32:35+09:00
draft: true
---

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