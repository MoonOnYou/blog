---
title: "Html,css"
date: 2018-06-03T03:33:33+09:00
draft: false
---

## brackets

1. Ctrl + D : 한줄 복사 및 생성
    * __모든 단축키에 Shift를 더하면 반대가 된다.__
        
        * 예시
        ```
        Shift + Ctrl + D // 한 줄 삭제 
        ```


***
## html
1. < img src="" alt="" >

    * src : 이미지 경로(상대적경로 또는 절대적경로 또는 이미지 URL) 

    * alt : 이미지를 못 불러올 경우, 이 텍스트가 나온다. 
        
        __* alt를 써줘야 하는 이유__

            1. 이미지가 안뜰 경우에도 검색엔진에 최적화 되기위해
            2. 프로그래머를 위해* 액박떳을 경우 사용자를 위해
            3. 시각장애인을 고려하여 웹사이트를 제작할때
            4. 웹표준 점수가 좋아짐
      
***

## css
1. __클래스 및 id 생성시 이름에 숫자를 포함하는 것은 좋지 않다.__
    
    * 프로젝트가 커지면 걷잡을 수 없다.

2. __css파일에서 가장 상위에 있어야 하는 것이 초기화이다.__

    * ```<ul> <li>``` 초기화를 해주어야 pading이 0으로 되서 글이 가운데로 이쁘게 된다.
        
        * 예시 

        ```css
        h1,h2,body,p,ul{ margin: 0; padding: 0;} /모든 h2에있는 기본마진을 없애겟다/

        h1{ font-weight: normal; }

        li{ list-style-type: none; }

        a{ color: dimgray; text-decoration: none; }
        
        a:hover, a:active{ text-decoration: none; color: dimgray; }
        ```

3. __공공재 style은 위 쪽 (상위)에 적어 주는 것이 좋다.__

4. __width는 960px__이 가장 많이 쓰이고 쓸때도 손 쉽게 쓸 수 있다.
