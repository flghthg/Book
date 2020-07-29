<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <script type="text/javascript">
	function send_check() {
		var f = document.f;//f라는 이름의 form을 검색
		
		//유효성 체크(보류)
		
		f.submit();
		
	}//send_check()
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
	 <table width="760" align="center" border="1">
		<div class="q" align="center">
						<p>comment</p> 
					</div>
		
		<tr>
			<td>
				<form action="reply.do" method="post" name="f">
					<input type="hidden" name="idx" value="${param.idx}">
					<input type="hidden" name="page" value="${param.page }">
 					
					<table width="750">
						
						<tr><!-- 삭제해도 상관없을듯 -->
							<td width="120" height="25" class="td">작성자</td>
							<td width="15">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
							<td><input name="name" 
							           style="width:550px" value="관리자"></td>
						</tr>
						
						<tr>
							<td class="td">내용</td>
							<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_2.gif">
							</td>
							<td colspan="3">
								<textarea name="content" rows="8" cols="75"></textarea>
							</td>
						</tr>
						
					</table>
					
					
					<table width="750">
						<tr><td height="5"></td></tr>
						
						<tr>
							<td align="center">
								<input onclick="send_check();" value="등록" type="button">
								<input onclick="location.href='qna.do'" value="취소" type="button">
							</td>
						</tr>
						
					</table>
					
				</form>
			</td>
		</tr>		
		
	</table> 
</div>
</div>	
</body>
</html>











