---
title: "Realm 설정하기"
date: 2018-06-05T20:20:13+09:00
draft: false
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
    * 필드를 수정해야 할 상황이 생길 수 있으므로 var으로 선언.

    * 인자가 없는 생성자를 생략해주기 위해 기본값을 모두 설정.
    
    * 상속이 가능 하도록 open.                           
    * getter,setter 없음.

3. 사용 설정 
    * 예제

    ㄱ. java예제
    ```
    public class Main3Activity extends AppCompatActivity {

        private Realm realm; //1
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate( savedInstanceState );
            setContentView( R.layout.activity_main3 );

            Realm.init(getApplicationContext()); //2
            realm = Realm.getDefaultInstance(); //2
           
        }

        @Override
        protected void onDestroy() { //3
        super.onDestroy(); //3
        realm.close(); //3
        }
    }
    ```
    1) Realm인스터스 클래스는 전역에서 사용하므로 클래스의 멤버변수로 선언하여 준다.

    2) Realm메소드를 초기화하고, 인스턴스를 가져와 멤버변수에 할당해준다

    3) 사용이 끝나면 close()메소드를 통해 자원을 반환해 줘야하므로 onDestroy메소드를 오버라이딩 해준다.

    ㄴ. Kotlin예제
    ```
    class Main2Activity : AppCompatActivity() {
    var realm:Realm? = null //1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main2)

        Realm.init(applicationContext) //2
        realm = Realm.getDefaultInstance()
    }

    override fun onDestroy() {
        super.onDestroy()
        realm?.close()
    }
    }
    ```
    1) 액티비티에서는 생성자가 아닌 onCreate메소드를 이용해 멤버변수를 초기화하므로 realm은 null이 가능한 타입, null로 초기화 해 두고 onCreate메소드에서 값을 할당하였다.

    2) onCreate메소드에서의 초기화도 getter를 자동호출해주는 코틀린의 특징 덕분에 일반적인 변수처럼 applicationContext라고 명시하였다.

4. insert , update 기능 메소드 구현하기

    * 예제

    ```
    private void insnertOrUpdateV1(final Student student) {
        realm.beginTransaction(); //1
        if(student.getStudentId() == 0) {
            Number maxId = realm.where( Student.class ).max( "StudentId" ); //3
            int nextId = maxId == null ? 1: maxId.intValue() + 1;
            student.setStudentId( nextId );
        }
        realm.insertOrUpdate( student );
        realm.commitTransaction(); //2
    }
    ```
    1) realm.beginTransaction(); 메소드로 트렌젝션의 시작을 알림

    2) realm.commitTransaction(); 메소드로 트렌젝션의 종료를 알림과 동시에 변경사항을 적용

    3) realm.where 메소드로 어떤 모델에서 값을 조회할 것인지 설정