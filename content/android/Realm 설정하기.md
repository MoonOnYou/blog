---
title: "Realm 설정하기"
date: 2018-06-05T20:20:13+09:00
draft: true
---

1. 의존성 설정

    1. 프로젝트 build.gradle 파일의 dependancies안에 아래의 문구를 추가한다.

    ```
    classpath "io.realm:realm-gradle-plugin:3.5.0"
    ```

    2. 어플리케이션 build.grable 파일의 dependancies안에 아래의 문구를 추가 한다.

    ```
    apply plugin: 'realm-android'
    ```

    3. Sync Now 를 클릭하여 스크립트를 적용한다. 

2. 모델 클래스

> 데이터 베이스와 매피할 ORM클래스를 정의 한다.

    * 예제 (학생정보 관리)

    ```java
    public class Student extends RealmObject //ReamlObject클래스를 상속 받으면 Reaml의 매핑 클래스가 된다.

    @PrimaryKey   //@PrimaryKey어노테이션으로 기본키 옵션을 준다.
    private int studentId;

    private String name;
    private int age;
    private int grade;

    //getter와 setter를 만들어 준다.
    ...중략...
    ```

    ```kotlin
    open class Student(@primaryKey open var studentId:Int? = null,  
                                   open var name:String? = null,
                                   open var age:Int? = null
                                   open var grade:Int? = null) : RealmObject()
    // 필드를 수정해야 할 상황이 생길 수 있으므로 var으로 선언.
    // 인자가 없는 생성자를 생략해주기 위해 기본값을 모두 설정.
    // 상속이 가능 하도록 open.                           
    //getter,setter 없음.
    ```