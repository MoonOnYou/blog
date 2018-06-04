---
title: "import API 정리"
date: 2018-06-04T23:28:54+09:00
draft: false
---
# MainActivity.kt
## permissionCheck()함수 구현분에서 사용한 import API 정리 

1. Manifest

import android.Manifest

```kotlin
# 사용
Manifest.permission.READ_EXTERNAL_STORAGE
Manifest.permission.WRITE_EXTERNAL_STORAGE
Manifest.permission.CAMERA
```

2. AppCompatActivity

import android.support.v7.app.AppCompatActivity
```kotlin
# 사용
class MainActivity : AppCompatActivity() { ... }
```

3. Bundle

import android.os.Bundle
* String값부터 다양한 parcelable type( 기본 type이 아닌 class객체를 activity 간에 주고 받기 위한 타입)까지 mapping해줌 

```kotlin
# 사용
override fun onCreate(savedInstanceState: Bundle?) { ... }
```

4. PackageManager

import android.content.pm.PackageManager

```kotlin
# 사용
PackageManager.PERMISSION_GRANTED
```

5. ActivityCompat

import android.support.v4.app.ActivityCompat

```kotlin
# 사용
ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE), 100)
``` 

6. ContextCompat

import android.support.v4.content.ContextCompat
```kotlin
# 사용
ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE)
```

7. Activity

import android.app.Activity
* 안드로이드 어플리케이션 구성요소 중 Activity를 사용하겠다고 선언