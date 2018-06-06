---
title: "Mine"
date: 2018-06-03T18:36:54+09:00
draft: false
---

# My Library

### 간단하게 알아둘 것

* android:onClick="함수 이름" : 해당 뷰가 클릭되었을 때 자바에서 "함수이름"과 같은 함수를 실행하라는 의미

* ~~Intent : 어떤 기능을 실행할 지 지정하기 위해 사용~~

* setContentView() : xml레이아웃에 정의된 뷰들을 메모리 상에 객체화하는 역할을 함

* AndroidManifest.xml : 앱에대한 정보를 담고있음 , 애플리케이션 구성요소나 권한 등의 정보를 정의함

* xmlns:android : API에 정의된 요소를 사용한다는 의미로,하나의 레이아웃 파일에 하나 이상 있어야 한다.

* Context란 : 일반적으로 어떤일이 발생한 상황을 의미하는데 프로그래밍에서는 객체의 상태정보를 표현하는 경우가 많다

### 꿀팁

* Alt+Tab같이 Ctrl+Tab 사용가능

* setting에서 show line numbers 사용하면 에러 발생 라인을 바로 알수 있다
    
* 함수 클릭 후 ctrl+q 하면 API간단하게 보임 , ctrl+함수클릭하면 API자세하게 보임
    
* ~~()사이 클릭 후 ctrl+p 하면 파라미터 후보들이 보임~~
    
* ctrl+f 파일에서 단어찾기 , ctrl+shift+f 폴더에서 단어 찾기 

## 색깔

1. #을 붙힌후 RGB 또는 ARGB 값을 16진수로 순서대로 준다

2. A는 알파로 투명도를 조절한다, 예로 FF는 투명하며 88은 반투명하다.

3. FF로 갈 수록(숫자가 커질수록) RGB 색이 진해진다.

## 화면에 시각적인 알림 모음

1. Toast
    
- 구글 API 문서 예시
    
    ```java 
    Context context = getApplicationContext();
    CharSequence text = "Hello toast!";
    int duration = Toast.LENGTH_SHORT;

    Toast toast = Toast.makeText(context, text, duration);
    toast.show();
    ```
    
- 보통 실전에서 쓰는 예시
    
    ```java 
    public void onButton1Click(View v){
        Tost toast = Toast.makeText(getApplicationContext,"안녕하세요",Toast.LENGTH_SHORT).show();
    }
    ```

## 다른 어 플과 연동 
~~
1. 웹,폰의 기본기능과 연결하는 Intent

- 책에 나온 예시 
   
    ```java
    public void onButton1Click(View v){
        Intent myIntent = new Intent(Intent.ACTION_VIEW,Uri.parse("http://m.naver.com"));
        startActivity(myIntent);
    }
    ```
~~
## 화면이동관련

1. 액티비티(화면)추가시 메니페스트 파일 고치기 

- Manifest.xml 파일에서 </activity> 위에 추가하면 된다.
       
    ```java
    <activity android:name=".추가된액티비티이름"></activity>
    즉 <activity android:name=".NewActivity"></activity>
    ```

2. 뒤로가기 

- 뒤로가기 버튼 클릭시 실행되는 함수에 finish();를 넣는다.

- 액티비티가 끝남으로써 뒤로 가는 것과 같은 효과가 나는 것 

### 자바코드에서 화면 구성하기
* 레이아웃을 xml로 정의하게 되면 나중에 화면구성을 바꿀때도 간단하게 수정가능하다.
그러나 사용자가 입력한 데이터 ,파일에서 읽어들이 데이터,네트워킹을 통헤 서버에서 받아온 데이터의
유형에 따라 화면의 구성을 바꾸고 싶다면 자바코드에서 화면을 구성하는 것이 훨씬 효율적이다.
    
- 예시 (onCreate클래스 안에서 다음 코드로 구성)
        
    ```java
    LinearLayout mainLayout = new LinearLayout(this);
    mainLayout.setOrientation(LinearLayout.VERTICAL);

    LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
    LinearLayout.LayoutParams.MATCH_PARENT,
    LinearLayout.LayoutParams.WRAP_CONTENT);
    ~~//뷰 생성자에는 항상 Context객체가 전달되야 하는데 액티비티는 Context를 상속하므로
    //액티비디클래스 안에서는 this를 Context객체로 사용할 수 있다~~
    Button button01 =new Button(this);
    button01.setText("Button01");
    button01.setLayoutParams(params);
    mainLayout.addView(button01);

    setContentView.(mainLayout);
    ```

- View를 상속하는 CustomView클래스에서 onDraw를 오버라이딩해 직접뷰를 만들어 줄 수 도 있다.


### 안드로이드의 매모리 속 인플레이션

1. 프로젝트 파일이 빌드될 때 xml레이아웃에 정의된 정보들이 객체화(inflation) 된다.

2. 자바코드에서 참조 할 때는 R.id.[아이디이름]으로 참조하고, 레이아웃에서 사용하는 형식은 @+id/[아이디 이름]이다.

## Edit Text

* input_type
    1. text
    
    2. textPassword

## xml파일 관련

1. border관련
    
    * solid : 단색으로 채워넣기
    
    * stroke : 테두리를 그려넣기 (dashWidth와 dashGap은 점선을 그릴 때 사용한다)
    
    * corners  : 가장자리를 둥글게 처리
   
   * padding : 패딩