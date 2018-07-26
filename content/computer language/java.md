---
title: "Java"
date: 2018-07-26T21:30:09+09:00
draft: true
---

# 자주 사용하는 String 클래스 함수

> 문자열은 char(문자형)이 배열로 이루어져 있기 때문에 문자열이라고 하는 것임


## 문자열 비교 

### equals(boolean반환) : 대소문자 구분하여 비교

> equals -> 동일한 

```java
String a = "문자";
String b = "문자열";
System.out.println(a.equals(b));
```

### equalsIgnoreCase(boolean반환) : 대소문자 구분않고 비교 

> ignore -> 무시하다 

```java
System.out.println(a.equalsIgnoreCase(b));
```


## 문자열 합치기 

### concat(String반환) 

> concatenate -> 사슬같이 잇다 

```java
String c = "가,나,다"+"라,마,바"; 
String d = a.concat("사,아,자");
System.out.println(d);
```


## 구분자로 문자열 분리 

### split(배열반환)

> split -> 분리되다

```java
String array[] = d.split(",");
System.out.println(array[1]);
```


## 문자열 교체 

### replaceAll(String반환) : 문자열에서 첫번째 파라미터 값을 찾아 두번째 파라미터 값으로 바꾼다.

> replace -> 교체하다 

``` java
String e = d.replaceAll("가","갸");
System.out.println(e);
```

## 문자열 길이 구하기 

### length(정수반환) 

> length -> 길이

> 문자열에서는 length(); 이지만 배열에서는 length;로 호출해야 한다 (괄호 차이)

```java
System.out.println(e.length());
```

## 시작 또는 끝나는 문자 검사하기 

### startWith(boolean반환) : 문자열의 시작이 비교하는 문자와 같은지 검사
### endWith(boolean반환) : 문자열의 끝이 비교하는 문자와 같은지 검사

```java
System.out.println("갸로 시작하나요?"+e.startWith("갸"));
```


## 특정 위치의 문자 반환

### charAt(char반환) : 반환값이 char이므로 한 글자만 반환

```java
char f  = e.charAt(1); // 파라미터로 문자열에서 반환받고 싶은 문자의 인덱스 값을 지정해준다
Systrm.out.println("문자열의 두번째 문자는 " + f + "입니다");
```

## 특정 위치의 문자열 반환
### trim : 문자열 맨앞과 맨뒤의 공백 제거 



## 문자열 검색 함수 : indexOf/int(index) 또는 -1 , contains/boolean

* indexOf

> 특정 문자열에서 검색 문자열의 인덱스를 반환  
> 인텍스인 int, 없으면 -1반환

```java

int position = array.indexOf("가"); 