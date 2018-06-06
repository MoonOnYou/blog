---
title: "Realm 설정하기"
date: 2018-06-05T20:20:13+09:00
draft: true
---

1. 의존성 설정

    a. 프로젝트 build.gradle 파일의 dependancies안에 아래의 문구를 추가한다.

    ```
    classpath "io.realm:realm-gradle-plugin:3.5.0"
    ```

    b. 어플리케이션 build.grable 파일의 dependancies안에 아래의 문구를 추가 한다.

    ```
    apply plugin: 'realm-android'
    ```

    c. Sync Now 를 클릭하여 스크립트를 적용한다. 

2. 모델 클래스

    a. 데이터 베이스와 매피할 ORM클래스를 정의 한다.

    * 예제 (학생정보 관리)

    ㄱ. JAVA예제

    ```java
    public class Student extends RealmObject //1

    @PrimaryKey   //2
    private int studentId;

    private String name;
    private int age;
    private int grade;

    //getter와 setter를 만들어 준다.
    ...중략...
    ```
    1) ReamlObject클래스를 상속 받으면 Reaml의 매핑 클래스가 된다.

    2) @PrimaryKey어노테이션으로 기본키 옵션을 준다.
    <br>

    ㄴ. Kotlin예제 
    ```
    open class Student(@primaryKey open var studentId:Int? = null,  
                                   open var name:String? = null,
                                   open var age:Int? = null
                                   open var grade:Int? = null) : RealmObject()

    ```
    1) 필드를 수정해야 할 상황이 생길 수 있으므로 var으로 선언.

    2) 인자가 없는 생성자를 생략해주기 위해 기본값을 모두 설정.
    
    3) 상속이 가능 하도록 open.                           
    4) getter,setter 없음.

3. 사용 설정 
    * 예제

    ㄱ. java예제
    ```
    public class Main3Activity extends AppCompatActivity {

        private Realm realm; //Realm인스터스 클래스는 전역에서 사용하므로 클래스의 멤버변수로 선언하여 준다.
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate( savedInstanceState );
            setContentView( R.layout.activity_main3 );

            Realm.init(getApplicationContext());
            realm = Realm.getDefaultInstance();
            //Realm메소드를 초기화하고, 인스턴스를 가져와 멤버변수에 할당해준다
        }

        @Override
        protected void onDestroy() {
        super.onDestroy();
        realm.close();
        }
    }
    ```
    ㄴ. Kotlin예제
    ```
    class Main2Activity : AppCompatActivity() {
    var realm:Realm? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main2)

        Realm.init(applicationContext)
        realm = Realm.getDefaultInstance()
    }

    override fun onDestroy() {
        super.onDestroy()
        realm?.close()
    }
}
```