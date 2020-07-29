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
		var subject=f.subject.value;
		var name=f.name.value;
		var content =f.content.value;
		var pwd=f.pwd.value;
		
		
		var ch= f.ch;
		
		//유효성 체크
		if( name=='' || pwd=='' || subject==''){
			alert("전부 입력하시오");
			return;
		}
		
		
		if(ch.checked){//체크할경우
			ch.value=1;
		}else if(!ch.checked){
			ch.value=0;
		}
		
		f.submit();
		
	}//send_check()
	
	//function checkbox(){
		
		//var f=document.checkf;
		
		
		
		//f.action="check.do";
		//f.submit();
		
	//}
</script>

<style type="text/css">
	  @import url('https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap');
  @import url('https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap');
	
	 *{
         box-sizing: border-box;
      }
      
      div{
         margin: auto;
         text-align: center;
      }	
	
		.q{
			 color: #E6E6E6;
	         top: 50px;
	         left: 30px;
	         font-size: 50px;
	         font-weight: bold;
	         font-family: 'Permanent Marker', cursive;
		}
      
       a{
	  	color:white;
	  	text-decoration:none;
	  }
	  
	  a:hover{
	  	color:yellow;
	  }
      
	.wrapper{
         height: 1000px;
         background-color:black;
      }
      
      .main{
         height: 30%;
         text-decoration-color: green;
         position: relative;
         background-color: black;
      }
      
      .main>input{
          width: 100%;
         height: 100%;
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
		
				<div class="q">
						<p>q&a</p> 
				</div>
		
		<tr>
			<td>
				<form action="insert.do?idx=${idx }" method="post" name="f">
					
					<table width="750">
						
						<tr>
							<td width="120" height="25" class="td">제목</td>
							<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
							<td><input name="subject" 
							           style="width:550px"></td>
						</tr>
						
						<tr>
							<td width="120" height="25" class="td">작성자</td>
							<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
							<td><input name="name" style="width:550px"></td>
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
						
						<tr>
							<td width="120" height="25" class="td">비밀번호</td>
							<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
							<td><input name="pwd" 
							           style="width:550px"
							           type="password"></td>
						</tr>
						
						<tr>
						<td colspan="3" style="color:white" align="right">비밀글
						<input type="checkbox" name="ch" value=""></td></form> </tr>
						
					</table>
					
					<table width="750">
						<tr><td height="5"></td></tr>
						
						<tr>
							<td align="center">
								<input type="button" value="등록" onclick="send_check();">
								<input type="button" value="취소" onclick="location.href='qna.do'">
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












