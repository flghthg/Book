<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	
	<script type="text/javascript">
		function reply(ch){
			var pwd=1234;
			
			if(ch != 1){
			var c_pwd = document.getElementById("c_pwd").value.trim();
			
			//관리자비밀번호지정(1234)
			//관리자 비번과 같을 경우에만 넘겨줌.-1 ㅇ
			//파라미터에서 입력하게끔 만들고 답변 버튼삭제시키는 방법-2 x
			if( c_pwd != pwd){
				alert("관리자에게만 댓글권한이 있습니다.");
				return;
			}
			
			}
			
			
			if(ch == 1){
				var password =  prompt("PASSWD 입력","");
				if(password == ""){
					alert("비밀번호를 입력하세요.");
					return;
				}else if(password != pwd){
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}

			}
			

			location.href="reply_form.do?idx=${vo.idx}&page=${param.page}";
			
		}
		
		function del(ch,p) {
			var pwd=0;
			
			//1인경우 pwd를 자동pwd와 같게 해줌.
			 if(ch ==1){
				pwd=p;
				
			}
			if( ch != 1){ 
			
				pwd = document.getElementById("c_pwd").value.trim();//입력받은값
				
			}
			
			if( confirm("게시글을 삭제 하시겠습니까?") ){
				var url = "del.do?idx=${vo.idx}&pwd="+pwd;
				sendRequest(url, null, resultFn, "post");
				
			}
		}
		
		function resultFn() {
			if( xhr.readyState == 4 && xhr.status == 200 ){

				var data=xhr.responseText;
				
				if( data == 'yes' ){
					alert("삭제성공");
					location.href="qna.do?page=${param.page}";
				}else{
					alert("비밀번호 불일치");
					return;
				}
				
			}
			
		}
			
		//수정
		function modify(f,ch){
			if(ch != 1){
			var pwd= document.getElementById("pwd").value;//원본
			var c_pwd=document.getElementById("c_pwd").value;//사용자 비번
			
			
			if( pwd != c_pwd){
				alert("비밀번호가 다릅니다.");
				return;
			}
			}
			f.action='modify_form_qna.do';
			f.submit();
			
		}
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
      
      .wrapper{
         height: 1000px;
         background-color:black;
      }
      
      .main{
         text-decoration-color: green;
         position: relative;
         background-color: black;
      }
      
      .main>input{
          width: 100%;
         height: 100%;
      }
      
      .q{
			  color: #E6E6E6;
	         left: 30px;
	         font-size: 40px;
	         font-weight: bold;
	         font-family: 'Permanent Marker', cursive; 
		}
		
		.td{
      	color:white;
      	 font-family:;
      }
      
      .t{
      	background-color:gray;
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
	
		
		
		<table align="center" class="t">
			<div class="q">
					<p>q&a</p> 
			</div>
			
			<tr>
				<td width="120" height="25" class="td">제목</td>
				<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
				<td>${vo.subject }</td>
			</tr>
			
			<tr>
				<td width="120" height="25" class="td">작성자</td>
				<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
				<td>${vo.name }</td>
			</tr>
			
			<tr>
				<td width="120" height="25" class="td">작성일</td>
				<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
				<td>${vo.regdate }</td>
			</tr>
			
			<tr>
				<td width="120" height="25" class="td">내용</td>
				<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
				<td><pre>${vo.content }</pre></td>
			</tr>
			
			
			<c:if test="${vo.ch ne 1}">
			
			<tr>
				<td width="120" height="25" class="td">비밀번호</td>
				<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
				<td>
					<input type="hidden" id="pwd" value="${vo.pwd }">
					<input type="password" id="c_pwd">
				</td>
			</tr>
			
		</c:if>
			
			
		</table>
		
		
		<table align="center">
			<tr>
				<td height="5"></td>
			</tr>
			
			<tr>
				<td align="right" colspan="2">
					<!-- 목록보기 -->
					<input type="button" value="목록보기" onclick="location.href='qna.do?page=${param.page}'">
					
					<c:if test="${re.depth ne 1}">	 
					<c:if test="${vo.depth lt 1 }">		 
					<!--  댓글달기 -->
					<input type="button"  onclick="reply(${vo.ch });" value="답변">
					</c:if>
					</c:if>
					
					<!-- 수정 -->
					<form method="post">
					<input type="hidden" name="idx" value="${vo.idx}">
					<input type="button"  onclick="modify(this.form,${vo.ch });" value="수정하기">
					</form>
					
					<!-- 삭제 -->
					<input type="button" value="글삭제"  onclick="del('${vo.ch}','${vo.pwd}');">
				</td>
			</tr>
		</table>
		<br>
		
		<!-- 답변이 달렸을경우 -->
		<c:if test="${re.depth eq 1}">
			<table align="center" class="t" >
				
			
				<tr>
					<td width="120" height="25" class="td">작성자</td>
					<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
					<td>${re.name }</td>
				</tr>
				
				<tr>
					<td width="120" height="25" class="td">작성일</td>
					<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
					<td>${re.regdate }</td>
				</tr>
				
				<tr>
					<td width="120" height="25" class="td">내용</td>
					<td width="2">
								<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
							</td>
					<td><pre>${re.content }</pre></td>
				</tr>
			</table>
		</c:if>
		
		
	</form>
	
</div></div>	
</body>
</html>