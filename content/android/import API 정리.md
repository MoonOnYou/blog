---
title: "import API 정리"
date: 2018-06-04T23:28:54+09:00
draft: true
---

## import API 정리 

### Manifest

* 사용예

    ```
    import android.Manifest

    Manifest.permission.READ_EXTERNAL_STORAGE
    Manifest.permission.WRITE_EXTERNAL_STORAGE
    Manifest.permission.CAMERA
    ```

### AppCompatActivity

* 사용예

    ```
    import android.support.v7.app.AppCompatActivity

    class MainActivity : AppCompatActivity() { ... }
    ```

### Bundle

> String값부터 다양한 parcelable type( 기본 type이 아닌 class객체를 activity 간에 주고 받기 위한 타입)까지 mapping해줌 

* 사용예

    ```
    import android.os.Bundle

    override fun onCreate(savedInstanceState: Bundle?) { ... }
    ```

### PackageManager

* 사용예

    ```
    import android.content.pm.PackageManager

    PackageManager.PERMISSION_GRANTED
    ```

### ActivityCompat

* 사용예

    ```
    import android.support.v4.app.ActivityCompat

    ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.READ_EXTERNAL_STORAGE), 100)
    ``` 

### ContextCompat

* 사용예

    ```
    import android.support.v4.content.ContextCompat

    ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE)
    ```

### Activity

> 안드로이드 어플리케이션 구성요소 중 Activity를 사용하겠다고 선언

* 사용예

    ```
    import android.app.Activity
    ```