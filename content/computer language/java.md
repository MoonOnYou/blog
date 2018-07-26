---
title: "Java"
date: 2018-07-26T21:30:09+09:00
draft: true
---

# 자주 사용하는 String함수 > 함수이름(반환타입)

> 문자열은 char(문자형)이 배열로 이루어져 있기 때문에 문자열이라고 하는 것임


## 문자열 비교 

### equals(boolean) : 대소문자 구분하여 비교

> equals -> 동일한 

```java
String a = "문자";
String b = "문자열";
System.out.println(a.equals(b));
```

### equalsIgnoreCase(boolean) : 대소문자 구분않고 비교 

> ignore -> 무시하다 

```java
System.out.println(a.equalsIgnoreCase(b));
```


## 문자열 합치기 

### concat(String) 

> concatenate -> 사슬같이 잇다 

```java
String c = "가,나,다"+"라,마,바"; 
String d = a.concat("사,아,자");
System.out.println(d);
```


## 구분자로 문자열 분리 

### split(배열)

> split -> 분리되다

```java
String array[] = d.split(",");
System.out.println(array[1]);
```


## 문자열 교체 

### replaceAll(String) : 문자열에서 첫번째 파라미터 값을 찾아 두번째 파라미터 값으로 바꾼다.

> replace -> 교체하다 

``` java
String e = d.replaceAll("가","갸");
System.out.println(e);
```

## 공백제거

### trim : 문자열 맨앞과 맨뒤의 공백 제거 



```

## 문자열 검색 함수 : indexOf/int(index) 또는 -1 , contains/boolean

* indexOf

> 특정 문자열에서 검색 문자열의 인덱스를 반환  
> 인텍스인 int, 없으면 -1반환

```java

int position = array.indexOf("가"); 