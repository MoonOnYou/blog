---
title: "Realm 설정하기"
date: 2018-06-05T20:20:13+09:00
draft: false
---

## Realm

> 예제는 학생정보 관리

> '숫자)' 는 숫자와 일치하는 주석의 코드를 풀이

1. __의존성 설정__

    a. 프로젝트 build.gradle 파일의 dependancies안에 아래의 문구를 추가한다.

    ```
    classpath "io.realm:realm-gradle-plugin:3.5.0"
    ```

    b. 어플리케이션 build.grable 파일의 dependancies안에 아래의 문구를 추가 한다.

    ```
    apply plugin: 'realm-android'
    ```

    c. Sync Now 를 클릭하여 스크립트를 적용한다. 

2. __모델 클래스__

    a. 데이터 베이스와 매핑할 ORM클래스를 정의 한다.

    _ㄱ. JAVA예제_

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

    _ㄴ. Kotlin예제_
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

3. __사용 설정__

    _ㄱ. java예제_
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

    _ㄴ. Kotlin예제_

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
        
    * 화면이 만들어지기 전에는 realm이 null이었는데 onCreate메소드가 호출되면서 realm에 값이 할당된다.

    2) onCreate메소드에서의 초기화도 getter를 자동호출해주는 코틀린의 특징 덕분에 일반적인 변수처럼 applicationContext라고 명시하였다.
       
    * java에서는 private으로 되어있는 Context를 가지고 오기 위해 getApplicationContext라는 getter함수를 호출하고 있는데 kotlin에서는 그럴 필요가 없이 바로 applicationContext로 부를 수 있는 것. 

4. __insert , update 기능 메소드 구현하기__

    _ㄱ. java예제_

    ```
    private void insnertOrUpdateV1(final Student student) {
        realm.beginTransaction(); //1
        if(student.getStudentId() == 0) {
            Number maxId = realm.where( Student.class ).max( "StudentId" ); //3
            int nextId = maxId == null ? 1: maxId.intValue() + 1; //4
            student.setStudentId( nextId ); //4
        }
        realm.insertOrUpdate( student ); //5
        realm.commitTransaction(); //2
    }
    ```
    1) realm.beginTransaction(); 메소드로 트렌젝션의 시작을 알림

    2) realm.commitTransaction(); 메소드로 트렌젝션의 종료를 알림과 동시에 변경사항을 적용

    3) realm.where 메소드로 Student.class에서 값을 조회할 것을 설정 

    * max 메소드를 통해 studentId필드의 최고값을 가져오라고 함

    4) 데이터베이스에 아직 아무 값이 없다면 1을, 아닐 경우에는 최고값에 1을 더한값을 nextId로 부여한다. 그리고 student객체에도 값을 부여

    5) insertOrUpdate메소드를 통해 변경된 내용을 적용 시킨다. 여기서 insertOrUpdate를 구분하는 것은 PrimaryKey로 선언된 studentId 필드이며 중복되는 값이 있으면 Update로, 없으면 Insert로 처리해줌

    _ㄴ. kotlin예제_

    ```
    fun insertOrUpdate(student: Student) {
        realm?.executeTransaction { realm ->
            if (student.studentId == 0) {
                val maxId = realm.where(Student::class.java).max("studentId") //1
                val nextId = (maxId.toInt() ?: 0) + 1 //2
                student.studentId = nextId //3
            }
            realm.insertOrUpdate(student)
        }
    }
    ```

    1) Student::class.java 처럼 자바 Class 클래스를 받는 곳에 사용

    2) ?: 문법을 이용하여 maxId가 Null일 경우에는 0, 아닐경우에는 maxId의 Ind값을 반환하여 1을 더하여 주게함

    3) getter와 setter가 자동 호출되므로 studentId를 student객체에 넣어줄 때에도 'student.setStudentId( nextId );'가 아닌 = 을 사용.

5. __정보 입력하기__

    _ㄱ. 자바예제_

    ```
    Student student1 = new Student();
    student1.setStudentId( 1 );
    student1.setName( "박중수" );
    student1.setAge( 26 );
    student1.setGrade( 4 );

    Student student2 = new Student();
    student2.setStudentId( 2 );
    student2.setName( "박영환" );
    student2.setAge( 27 );
    student2.setGrade( 4 );

    insnertOrUpdateV( student1 );
    insnertOrUpdateV( student2 );
    ```

    _ㄴ. kotlin 예제_
    ```
    val student1 = Student(1,"박중수",26,4)
    val student2 = Student(2,"박영환",27,4)

    insertOrUpdate(student1)
    insertOrUpdate(student2)
    ```

6. __Select__

    __6.1 데이터 불러오기__

    _ㄱ. java 예제_ 

    a. 전체를 불러오는 메소드  

    ```
    private List<Student> findAll(){
        RealmResults<Student> results = realm.where(Student.class) //1
                .findAll() //2
                .sort("studentId", Sort.DESCENDING); //4
        List<Student> list = results; //3

        return  list;
    }
    ```
    > (+)위에코드에서 특정 인덱스의 값 불러오고싶을땐 다음 코드를 추가
        
    ```
    Student student = results.get(2);
    ```

    1) where메소드를 통해 Student에서 찾을것을 realm에게 알려줌
    
    2) findAll()메소드를 통해 모든 결과를 가져오도록 함

    1,3) 받아온 결과는 RealmResults 라는 객체에 담기게 된다

    * RealmResults<E> 클래스는 List<E>인터페이스를 상속받은 클래스이기에 다향성을 이용해 List에 담을 수 있다. 이 코드는 이를 이용해 List형식으로 반환했다.

    4) 오름차순 정렬을 해주었다
    
    b. id를 조건으로 데이터를 불러오는 메소드 

    ```
    private Student findOndeById(int studentId){
        Student results = realm.where(Student.class) //1
                .equalTo("studentId",studentId) //2
                .findFirst(); //3
        return results;
    }
    ```

    1) where메소드를 통해 Student에서 찾을것을 realm에게 알려줌

    2) equalTo메소드를 통해 일치해야하는 조건 갑을 알려줌 
    
    * 첫번째 매개변수는 필드이름, 두번째는 일치해야하는 필드의 값

    * equalTo메소드 뒤에도 Like, endsWith 등의 조건을 추가할 수 있다. ( 지연연산을 통해 효율적으로 실행됨)

    3) findFirst()메소드를 통해 일치하는 상위 1개의 필드만 가져오게 함

    * 만약 일치하는 모든 것을 가져오고 신다면 findAll()메소드를 이용

    _ㄴ. kotlin 예제_

    a. 전체를 불러오는 메소드 
    ```
    fun findAll(): List<Student>? {
        val results = realm?.where(Student::class.java)
                ?.findAll()
                ?.sort("studentId", Sort.DESCENDING)

        return results
    }
    ```
    
    b. id를 조건으로 테이터를 불러오는 메소드 
    ```
    fun findOneById(studentId: Int): Student? {
    val result = realm?.where(Student::class.java)
            ?.equalTo("studentId",studentId)
            ?.findFirst()

        return result
    }
    ```

    __6.2 데이터 출력하기__

    a. 원하는 activity.xml 파일안에 출력을 원하는 TextView를 만들어 아이디 지정.

    b. 원하는 Activity.java(또는 kotlin) 에서 클래스 멤버변수로 TextView객체를 원하는 이름과 함께 추가 

    c. onCreate에 뷰를 불러오는 코드를 작성

    d. 미리만들어 놓은 메소드로 데이터를 불러와 화면에 출력하는 코드 작성 

    _ㄱ. java예제_
    
    > b,c,d 순
    
    ```
    private TextView name;
    ```
    
    ```
    name = (TextView)findById(R.id.TextView의 id이름)
    ```

    ```
    List<Student> studentList = findAll();
    Student oneStudend = findOndeById( 1 );

    StringBuilder sb = new StringBuilder( );
    sb.append( "== List == \n" );
        if(studentList != null) {
            for (Student student : studentList) {
                sb.append( student.getStudentId() )
                        .append( ". " )
                        .append( student.getName() )
                        .append( " - " )
                        .append( student.getAge() )
                        .append( "살 - " )
                        .append( student.getGrade() )
                        .append( "학년\n" );
            }
        }

        if(oneStudend != null) {
            sb.append( "\n\n==Select One==\n\n" )
                    .append( oneStudend.getStudentId() )
                    .append( ". " )
                    .append( oneStudend.getName() )
                    .append( " - " )
                    .append( oneStudend.getAge() )
                    .append( "살 - " )
                    .append( oneStudend.getGrade())
                    .append( "학년\n" );
        }

        textView.setText( sb.toString() );
    ```

    _ㄴ. kotlin예제_

    > b,c,d 순

    ```
    name = findViewById(R.id.view_txt) as TextView
    ```

    ```
    var name:TextView? = null
    ```

    ```
    val studentList = findAll()
    val oneStudent = findOneById(1)

    val sb = StringBuilder()

    sb.append("==List==\n")
    studentList?.let {
        for (student in it) {
            sb.append(student.studentId)
                    .append(".")
                    .append(student.name)
                    .append(" - ")
                    .append(student.age)
                    .append("살 - ")
                    .append(student.grade)
                    .append("학년\n")
        }
    }

    oneStudent?.let {
        sb.append("\n\n== Select One ==\n")
                .append(oneStudent.studentId)
                .append(". ")
                .append(oneStudent.name)
                .append(" - ")
                .append(oneStudent.age)
                .append("살 - ")
                .append(oneStudent.grade)
                .append("학년\n")
    }

    textView?.text = sb.toString()
    ```

6. __Delete__

> 예제는 id를 조건으로 하는 삭제 코드임 

> 삭제에는 쓰기 ,수정과 같이 트랜잭션 블록을 이용하는 방법과 begin, commit Transaction 코드를 이용하는 방법 두 가지가 있음

> 이 책에서 저자는 트랜잭션 블록을 사용함

_ㄱ. java예제_

    private void deleteById(final int studentId) {
        realm.executeTransaction( new Realm.Transaction() {
            @Override
            public void execute(Realm realm) {
                Student targetStudent = realm.where( Student.class )
                            .equalTo( "studentId",studentId )
                            .findFirst();

                targetStudent.deleteFromRealm();
            }
        });
    }


_ㄴ. kotlin예제_

    private fun deleteById(studentId: Int) {
        realm?.executeTransaction {
            val targetStudent = it.where(Student::class.java)
                    .equalTo("studentId",studentId)
                    .findFirst()

            targetStudent.deleteFromRealm()
        }
    }



_책 ' 자바 개발자를 위한 kotlin (박중수 저) ' 를 보고 정리하였습니다_