<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - xml</title>
</head>
<body>
	<!-- 외부 문서 가져옴 -->
	<c:import url="inc/bookList.xml" var="booklist" charEncoding="utf-8" />
	
	<!-- 선언한 변수를 파싱해줄 태그 선언 -->
	<x:parse xml="${booklist }" var="blist" />
	
	<h4>파싱</h4>
	<!-- out 태그 이용해 파싱된 내용 출력
		 select 속성의 값이 XPath임.
		 XPath는 EL과 다르게 {} 사용하지 않음.
	 -->
	제목 : <x:out select="$blist/booklist/book[1]/name"/><br>
	저자 : <x:out select="$blist/booklist/book[1]/author"/><br>
	가격 : <x:out select="$blist/booklist/book[1]/price"/><br><br>
	
	<h4>파싱2</h4>
	<table border="1">
		<tr>
			<th>제목</th><th>저자</th><th>가격</th>
		</tr>
		<x:forEach select="$blist/booklist/book" var="item">
		<tr>	
			<td><x:out select="$item/name"/></td>
			<td><x:out select="$item/author"/></td>
			<td>
				<x:choose>
					<x:when select="$item/price >= 20000">
						2만원 이상 <br>
					</x:when>
					<x:otherwise>
						2만원 미만 <br>
					</x:otherwise>
				</x:choose>		
			</td>			
		</tr>
		</x:forEach>
	</table>
</body>
</html>