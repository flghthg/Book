<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script type="text/javascript">
	function modify(f){
		var subject=f.subject.value;
		var name=f.name.value;
		var content =f.content.value;
		var pwd=f.pwd.value;
		
		//유효성 체크
		if( name=='' || pwd=='' || subject==''){
			alert("전부 입력하시오");
			return;
		}
		
		f.action="modify.do";
		f.method="get";
		f.submit();
	}
	</script>
	
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
		
	</style>
		
</head>
<body>
<div class="wrapper">
 <div class="main">	
	<form >
	<table  width="750" align="center">
					<div class="q" align="center">
						<p>Modify</p> 
					</div>
						
						<input type="hidden" name="idx" value="${vo.idx }">
						
						<tr>
							<td width="120" height="25" class="td">제목</td>
							<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
							<td>
							<input name="subject" style="width:550px" value="${vo.subject }" style="color:gray">
							</td>
						</tr>
						
						<tr>
							<td width="120" height="25" class="td">작성자</td>
							<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
							<td>
							<input name="name" style="width:550px" value="${vo.name }">
							</td>
						</tr>
						
						<tr>
							<td class="td">내용</td>
							<td width="20">
								<img src="${ pageContext.request.contextPath }/resources/img/line_2.gif">
							</td>
							<td colspan="3">
								<textarea name="content" rows="8" cols="75">${vo.content }</textarea>
							</td>
						</tr>
						
						<tr>
							<td width="120" height="25" class="td">비밀번호</td>
							<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
							<td>
							<input name="pwd" style="width:550px" type="password" value="${vo.pwd }">
							</td>
						</tr>
						
						<tr height="10">
						</tr>
						
						<tr>
						<td height="10"></td>
						<td colspan="2" align="right">
						<input type="button" value="수정" onclick="modify(this.form);">
						<input type="button" value="목록보기"  
						 onclick="location.href='qna.do?page=${param.page}'">
						 </td>
						 </tr>
		</table>
	</form>
</div></div>	
	
</body>
</html>