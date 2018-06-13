---
title: "Gradle"
date: 2018-06-07T23:19:53+09:00
draft: true
---

# Installing with a package manager

- 배포된 버전 확인

> https://gradle.org/releases/


# 패키지 저장소 추가
sudo add-apt-repository ppa:cwchien/gradle
sudo apt-get update

# 설치
sudo apt-get install gradle-4.8

# 버전확인

gradle -v

```
update-alternatives: using /usr/lib/gradle/4.8/bin/gradle to provide /usr/bin/gradle (gradle) in auto mode
```

# 불필요 패키지 제거

sudo apt autoremove

# 패키지가 설치된 경로 찾기

dpkg -L gradle


# 안드로이드 Gradle

- 안드로이드 스튜디오는 편집만 담당할 뿐, 빌드는 Gradle 을 통해 수행됨

- 라이브러리 설치 도구로도 이용

- gradle 스크립트 내용에는 빌드에 사용할 sdk 버전, 애플리케이션 버전, 사용하는 라이브러리 등의 내용이 포함됨

## 프로젝트 build.gradle

- Android Gradle 플러그인 버전 지정

- 하위 모듈 공통적으로 해당하는 항목들 지정

## App(모듈)의 Build.gradle

- AndroidManifest.xml 재정의
build tools / minSDK / targetSDK / ApplicationID / versionCode / VersionName 등

## Settings.gradle

멀티 프로젝트에 포함되는 하위 모듈 목록

## Gradle.properties

기타 환경 변수들

## Local.properties

SDK Home 등

## 명령어

./gradlew :app:dependencies

## 참고링크

- https://www.slideshare.net/koreacio/gradle-64458419

- https://guides.gradle.org/building-android-apps/?_ga=2.52121193.1300548979.1528291190-326059834.1527966143