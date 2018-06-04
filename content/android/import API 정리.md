---
title: "import API 정리"
date: 2018-06-04T23:28:54+09:00
draft: false
---
# MainActivity.kt
## permissionCheck()함수 구현분에서 사용한 import API 정리 

1. import android.Manifest
2. import android.content.pm.PackageManager
3. import android.support.v7.app.AppCompatActivity
4. import android.os.Bundle
    * String값부터 다양한 parcelable type( 기본 type이 아닌 class객체를 activity 간에 주고 받기 위한 타입)까지 mapping해줌 
5. import android.support.v4.app.ActivityCompat
6. import android.support.v4.content.ContextCompat


## 기타
1. import android.app.Activity
    * 안드로이드 어플리케이션 구성요소 중 Activity를 사용하겠다고 선언