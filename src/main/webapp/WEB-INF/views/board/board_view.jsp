<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	<style type="text/css">
		.wrapper{
         height: 1000px;
         background-color:black;
      }
      
      .main{
         text-decoration-color: green;
         position: relative;
         background-color: black;
      }
      
      .q{	
			 color: #E6E6E6;
	         left: 30px;
	         font-size: 30px;
	         font-weight: bold;
	         font-family: 'Permanent Marker'; 
		}
		
		.td{
      	color:white;
      	 font-family:;
      }
		
	 a{color:white;
      	text-decoration:none;}
	  a:hover{color:yellow;}
		
	</style>
</head>
<body>
<div class="wrapper">
 <div class="main">	
	<form name="f" method="post">
	<br>
		<div class="q" align="center">
						<p>상세보기</p> 
			</div>
			<br>
		<table align="center" style="background-color:gray">
			
			
			<tr>
				<td width="120" height="25" class="td">제목</td>
				<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
				<td class="td">${vo.subject }</td>
			</tr>
			
			<tr>
				<td width="120" height="25" class="td">작성자</td>
				<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
				<td class="td">${vo.name }</td>
			</tr>
			
			<tr>
				<td width="120" height="25" class="td">작성일</td>
				<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
				<td class="td">${vo.regdate }</td>
			</tr>
			
			<tr>
				<td width="120" height="25" class="td">내용</td>
				<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
				
				<td class="td"><pre>${vo.content }</pre></td>
			</tr>
			
		</table>
		
		<table align="center">
			<tr>
				<td height="5"></td>
			</tr>
			
			<tr>
				<td>
					<!-- 목록보기 -->
					<a href="list.do?page=${param.page}">[목록보기]</a>
				
				</td>
			</tr>
		</table>
		
		
		
	</form>
	
</div></div>	
</body>
</html>