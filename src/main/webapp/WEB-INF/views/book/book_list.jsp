<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${ pageContext.request.contextPath }/resources/css/book_list.css" rel="stylesheet" type="text/css" />
</head>
<body>
	
	<jsp:include page="navi.jsp"/>

	<div class="margin">
		
		<h2>BOOK LIST</h2>
	
		<ul class="category clearfix margin">
			<li><a href="booklist.do?category=novel">novel</a></li>
			<li><a href="booklist.do?category=essay">essay</a></li>
			<li><a href="booklist.do?category=poem">poem</a></li>
			<li><a href="booklist.do?category=self-improvement">self-improvement</a></li>
			<li><a href="booklist.do?category=humanities">humanities</a></li>
			<li><a href="booklist.do?category=comics">comics</a></li>
		</ul>
		
		
		<ul class="list margin">
			
			<!-- 제품이 없는 경우 -->
			<c:if test="${ empty list }">
				<li id="none">
					해당 서적이 없습니다
				</li>
			</c:if>
			
			<c:forEach var="b" items="${list}">
			
			<li border="1" align="center">
				<a href="bookview.do?idx=${b.idx }&id=${sessionScope.Success_id}">
					<img src="${ pageContext.request.contextPath }/resources/img/${b.b_image_s}"><br>
					<span>${b.b_name}</span><br>
					<span><fmt:formatNumber value="${b.b_price}"/></span>
				</a>
			</li>
			
			</c:forEach>
		</ul>
		
		<!-- 존재할경우 -->
		<c:if test="${not empty search }">
			<ul class="list margin clearfix">
				<li border="1" align="center">
					<a href="bookview.do?idx=${search.idx }&id=${sessionScope.Success_id}">
						<img src="${ pageContext.request.contextPath }/resources/img/${search.b_image_s}"><br>
						<span>${b.b_name}</span><br>
						<span><fmt:formatNumber value="${search.b_price}"/></span>
					</a>
				</li>
			
			</ul>
		</c:if>
		
	</div>
</body>
</html>