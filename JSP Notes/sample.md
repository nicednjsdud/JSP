MemberDAO.java

```java
//(....)

pstmt = conn.prepareStatement(query);

pstmt.setString(1,id);      // insert문의 ?에 순서대로 회원정보 세팅
pstmt.setString(2,pwd);     
pstmt.setString(3,name);
pstmt.setString(4.email);

pstmt.executeUpdate();      // 회원정보 테이블의 추가됨
close();

...

public void delMember(String id){
    try{
        conn = dataFactory.getConnection();
        String query = "DELETE FROM T_MEMBER WHERE ID =?";//delete문을 문자열로 만듬
        System.out.println(query);

        pstmt = conn.prepareStatement(query);    
        pstmt.setString(1,id);      // 첫번째 '?'에 전달된 ID를 인자로 넣음   
        pstmt.executeUpdate();     // delete 문 실행 => 테이블에서 해당 id 회원 정보 삭제
        close();             


    }catch (SQLException e){
        e.printStackTrace();
    }
}


```

```sql
    DBeaver

    DELETE FROM T_MEMBER WHERE ID ='ezen';
```

![alt](/assets/images/post/jsp/20.png)

2) DataSource 이용해 회원 정보 등록하기
    - PreparedStatement를 이용한 insert문 사용하는 방법
    - ?는 id, PWD, NAME, EMAIL에 순서대로 대응한다.
    - 각 ?에 대응하는 값을 지정하기 PreparedStatement의 setter를 이용함
    - setter()메서드의 첫번째 인자는 '?'의 순서를 지정함
    - ?은 1부터 시작함
    - insert, delete,update문은 executeUpdate() 메서드를 호출함.
